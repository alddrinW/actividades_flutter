import '../models/invoice_data.dart';
import 'regex_utils.dart';

class InvoiceParser {
  static InvoiceData parse(String rawText) {
    final invoice = InvoiceData();

    final lines = rawText.split('\n');

    // ---------- FECHA ----------
    for (var line in lines) {
      final match = RegexUtils.fechaRegex.firstMatch(line);
      if (match != null) {
        invoice.fecha = match.group(0);
        break;
      }
    }

    // ---------- CÓDIGO FACTURA ----------
    for (var line in lines) {
      final match = RegexUtils.codigoFacturaRegex.firstMatch(line);
      if (match != null) {
        invoice.codigoFactura = match.group(0);
        break;
      }
    }

    // ---------- MONTO TOTAL ----------
    double maxAmount = 0;
    String? selectedAmount;

    for (var line in lines) {
      final lower = line.toLowerCase();

      // Ignorar subtotales e IVA
      if (lower.contains('subtotal') || lower.contains('iva')) {
        continue;
      }

      final matches = RegexUtils.montoRegex.allMatches(line);

      for (var m in matches) {
        final raw = m.group(0)!;
        final normalized =
            raw.replaceAll('\$', '').replaceAll(',', '.').trim();

        final value = double.tryParse(normalized);

        if (value != null) {
          if (lower.contains('total')) {
            invoice.total = raw;
            return invoice;
          }

          if (value > maxAmount) {
            maxAmount = value;
            selectedAmount = raw;
          }
        }
      }
    }

    invoice.total = selectedAmount;
    return invoice;
  }
}
