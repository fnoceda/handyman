
import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';

class WorkersSlideMapper{
  static jsonToEntity( Map<String,dynamic> json)=> CardWorkerSlideData(

    backgroundImage:json['profile_photo_path'],
    price:json['price'],
    profession:json['profession'],
    qualification:json['qualification'],
    profesionalName:json['name'],
    profileImage:json['profile_photo_path'],
    shortDescription:json['short_description'],
  );
}
