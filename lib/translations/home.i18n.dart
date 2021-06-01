import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  //en,fr,es,de
  static var _t = Translations("en") +
      {
        "en": "Home",
        "fr": "Maison",
        "es": "Hogar",
        "de": "Zuhause",
        "pt": "Casa",
        "ar": "الصفحة الرئيسية",
        "ko": "집"
      } +
      {
        "en": "Orders",
        "fr": "Ordres",
        "es": "Pedidos",
        "de": "Aufträge",
        "pt": "Pedidos",
        "ar": "الطلب #٪ s",
        "ko": "명령"
      } +
      {
        "en": "Cart",
        "fr": "Chariot",
        "es": "Carro",
        "de": "Wagen",
        "pt": "Carrinho",
        "ar": "عربة التسوق",
        "ko": "카트"
      } +
      {
        "en": "More",
        "fr": "Suite",
        "es": "Más",
        "de": "Mehr",
        "pt": "Mais",
        "ar": "أكثر",
        "ko": "더"
      } +
      {
        "en": "Assigned",
        "fr": "Attribué",
        "es": "Asignado",
        "de": "Zugewiesen",
        "pt": "Atribuído",
        "ar": "مكلف",
        "ko": "할당 됨"
      } +
      {
        "en": "Offline",
        "fr": "Hors ligne",
        "es": "Desconectado",
        "de": "Offline",
        "pt": "desligada",
        "ar": "غير متصل على الانترنت",
        "ko": "오프라인"
      } +
      {
        "en": "Online",
        "fr": "En ligne",
        "es": "En línea",
        "de": "Online",
        "pt": "Conectados",
        "ar": "متصل",
        "ko": "온라인"
      } +
      {
        "en": "Updated Successfully",
        "fr": "Mis à jour avec succés",
        "es": "Actualizado con éxito",
        "de": "Erfolgreich geupdated",
        "pt": "Atualizado com sucesso",
        "ar": "تم التحديث بنجاح",
        "ko": "성공적으로 업데이트 됨"
      } +
      {
        "en": "New Order Alert",
        "fr": "Nouvelle alerte de commande",
        "es": "Alerta de nuevo pedido",
        "de": "New Order Alert",
        "pt": "Alerta de novo pedido",
        "ar": "تنبيه طلب جديد",
        "ko": "새로운 주문 알림"
      } +
      {
        "en": "Pickup Location",
        "fr": "Lieu de ramassage",
        "es": "Lugar de recogida",
        "de": "Treffpunkt",
        "pt": "Local de coleta",
        "ar": "اختر موقعا",
        "ko": "짐을 싣는 곳"
      } +
      {
        "en": "Dropoff Location",
        "fr": "Point de chute",
        "es": "Punto de entrega",
        "de": "Rückgabestation",
        "pt": "Local de entrega",
        "ar": "موقع الإنزال",
        "ko": "반납 장소"
      } +
      {
        "en": "Delivery Fee",
        "fr": "Frais de livraison",
        "es": "Gastos de envío",
        "de": "Liefergebühr",
        "pt": "Taxa de entrega",
        "ar": "رسوم التوصيل",
        "ko": "배달비"
      } +
      {
        "en": "Accept",
        "fr": "J'accepte",
        "es": "Aceptar",
        "de": "Akzeptieren",
        "pt": "Aceitar",
        "ar": "قبول",
        "ko": "동의하기"
      } +
      {
        "en": "Swipe to accept order",
        "fr": "Faites glisser pour accepter la commande",
        "es": "Desliza para aceptar el pedido",
        "de": "Wischen Sie, um die Bestellung anzunehmen",
        "pt": "Deslize para aceitar o pedido",
        "ar": "مرر لقبول الطلب",
        "ko": "주문을 수락하려면 스 와이프하세요."
      };

  String get i18n => localize(this, _t);
  String fill(List<Object> params) => localizeFill(this, params);
}
