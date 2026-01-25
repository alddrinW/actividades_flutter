import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  GoogleMapController? _mapController;

  LatLng? _currentPosition;
  bool _isLoading = true;

  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  // 📍 Punto fijo (ejemplo: universidad — cambia si quieres)
  final LatLng _destino = const LatLng(-0.2100, -78.4890);

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  /// 🔐 Lógica completa de permisos y GPS
  Future<void> _initLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1️⃣ Verificar si el GPS está encendido
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showMessage('El GPS está desactivado');
      setState(() => _isLoading = false);
      return;
    }

    // 2️⃣ Verificar permisos
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        _showMessage('Permiso de ubicación denegado');
        setState(() => _isLoading = false);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showMessage(
        'El permiso fue denegado permanentemente. Actívalo desde ajustes.',
      );
      setState(() => _isLoading = false);
      return;
    }

    // 3️⃣ Obtener ubicación actual
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _currentPosition = LatLng(position.latitude, position.longitude);

    _setMarker();
    _setPolyline();

    setState(() => _isLoading = false);
  }

  /// 📌 Marcador de ubicación actual
  void _setMarker() {
    _markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: _currentPosition!,
        infoWindow: const InfoWindow(
          title: 'Tu ubicación actual',
        ),
      ),
    );
  }

  /// 🛣️ Polilínea (extra)
  void _setPolyline() {
    _polylines.add(
      Polyline(
        polylineId: const PolylineId('ruta'),
        points: [
          _currentPosition!,
          _destino,
        ],
        width: 5,
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _currentPosition == null
              ? const Center(
                  child: Text('No se pudo obtener la ubicación'),
                )
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _currentPosition!,
                    zoom: 15,
                  ),
                  myLocationEnabled: true,
                  markers: _markers,
                  polylines: _polylines,
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                ),
    );
  }
}
