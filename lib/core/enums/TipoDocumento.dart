enum TipoDocumento {
  DNI,
  RUC,
  CE,
  PAS,
}

const Map<TipoDocumento, String> TipoDocumentoId = {
  TipoDocumento.DNI : "1",
  TipoDocumento.RUC : "2",
  TipoDocumento.CE  : "3",
  TipoDocumento.PAS : "4",
};