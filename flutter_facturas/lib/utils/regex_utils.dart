class RegexUtils {
  // Fechas: DD/MM/AAAA, DD-MM-AAAA, AAAA-MM-DD
  static final RegExp fechaRegex = RegExp(
    r'\b(\d{2}[\/-]\d{2}[\/-]\d{4}|\d{4}-\d{2}-\d{2})\b',
  );

  // Montos: $123.45 | 123,45 | 123.45
  static final RegExp montoRegex = RegExp(
    r'\$?\s?\d+(?:[.,]\d{2})',
  );

  // Código de factura: 001-001-123456789
  static final RegExp codigoFacturaRegex = RegExp(
    r'\b\d{3}-\d{3}-\d{6,}\b',
  );
}
