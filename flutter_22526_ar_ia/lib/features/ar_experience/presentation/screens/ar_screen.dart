import 'package:ar_flutter_plugin_2/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin_2/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin_2/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_2/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_2/models/ar_anchor.dart';
import 'package:ar_flutter_plugin_2/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin_2/models/ar_node.dart';
import 'package:ar_flutter_plugin_2/widgets/ar_view.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArScreen extends StatefulWidget {
  const ArScreen({super.key});

  @override
  State<ArScreen> createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;

  ARAnchorManager? arAnchorManager;

  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];

  @override
  void dispose() {
    super.dispose();
    arSessionManager?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AR Flutter Plugin')),
      body: Stack(
        children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),

          // retroalimentacion para llamar la atención del usuario
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.black,
              child: Text(
                'Apunta al suelo y mueve el celular, cuando veas puntos, tocalos para poner el objeto',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager anchorManager,
    ARLocationManager locationManager,
  ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;
    arAnchorManager = anchorManager;

    arSessionManager!.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: null,
      showWorldOrigin: true,
      handlePans: true,
      handleRotation: true,
    );

    //listener para detectar toques en el mundo real
    arSessionManager!.onPlaneOrPointTap = onPlaneOrPointTapped;

    //listener 2
    arObjectManager!.onNodeTap = onNodeTapped;
  }

  Future<void> onPlaneOrPointTapped(List<ARHitTestResult> hitTestResult) async {
    if (hitTestResult.isEmpty) return;

    var singleHitTestResult = hitTestResult.firstWhere(
      (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane,
    );

    var newAnchor = ARPlaneAnchor(
      transformation: singleHitTestResult.worldTransform,
    );

    bool? didAddAnchor = await arAnchorManager!.addAnchor(newAnchor);

    if (didAddAnchor == true) {
      anchors.add(newAnchor);

      var newNode = ARNode(
        type: NodeType.webGLB,
        uri: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        scale: vector.Vector3(0.2, 0.2, 0.2),
        position: vector.Vector3(0.0, 0.0, 0.0),
        rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0),
      );

      bool? didAddNodeToAnchor = await arObjectManager!.addNode(
        newNode,
        planeAnchor: newAnchor,
      );

      if (didAddNodeToAnchor == true) {
        nodes.add(newNode);

        setState(() {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Objeto agregado con exito')));
        });
      }
    }
  }

  onNodeTapped(List<String> nodes) {
    var number = nodes.length;

    arSessionManager?.onError?.call("Tocado $number nodo(s)");
  }
}
