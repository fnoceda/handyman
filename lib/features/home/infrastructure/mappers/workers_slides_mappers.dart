
import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';

class WorkersSlideMapper{
  static jsonToEntity( Map<String,dynamic> json)=> CardWorkerSlideData(
    backgroundImage:
    // json['profile_photo_path'],
    (json['profile_photo_path'] != '')
          ? 'https://handyman.soluciones.dev/storage/images/${json['profile_photo_path']}'
          : 'https://ih1.redbubble.net/image.1027712254.9762/pp,840x830-pad,1000x1000,f8f8f8.u2.jpg',
    price:  double.parse(json['price'].toString()),
    profession:json['profession'],
    qualification:double.parse(json['qualification'].toString()),
    profesionalName:json['name'],
    profileImage:json['profile_photo_path'],
    shortDescription:json['short_description'],
  );
}
