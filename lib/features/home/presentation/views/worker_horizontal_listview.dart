import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handiman_v0/core/config/helpers/human_formats.dart';
import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';
import 'package:handiman_v0/features/home/presentation/providers/slide_workers_state_providers.dart';

class WorkerHorizontalListView extends ConsumerStatefulWidget {
  final List<CardWorkerSlideData> slides;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  final IconData? icon;

  const WorkerHorizontalListView(
      {super.key,
      required this.slides,
      this.title,
      this.icon,
      this.subTitle,
      this.loadNextPage});

  @override
  WorkerHorizontalListViewState createState() => WorkerHorizontalListViewState();
}

class WorkerHorizontalListViewState extends ConsumerState<WorkerHorizontalListView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
       if((scrollController.position.pixels + 400) >= scrollController.position.maxScrollExtent ){
           ref.read(slideWorkersProvider.notifier).loadNextPage();
        }
    });
    
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle, icon: widget.icon,),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            itemCount: widget.slides.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _Slide(slide: widget.slides[index]);
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final CardWorkerSlideData slide;
  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w), // Adaptado con ScreenUtil
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* image
          Container(
            width: 133.w,
            height: 133.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r), // Adaptado con ScreenUtil
                color: Colors.white),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r), // Adaptado con ScreenUtil
              child: Image.network(
                slide.backgroundImage,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Padding(
                      padding: EdgeInsets.all(8.w),
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {},
                    child: FadeIn(child: child),
                  );
                },
              ),
            ),
          ),
          //* sizebox
          SizedBox(height: 8.h),
          //*title
          SizedBox(
            child: Text(
              slide.shortDescription,
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 14.sp), // Adaptado con ScreenUtil
            ),
          ),
          //*name
          SizedBox(
            child: Center(
              child: Text(
                slide.profesionalName,
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 14.sp), // Adaptado con ScreenUtil
              ),
            ),
          ),
          //*Rating
          SizedBox(
            width: 150.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 45.w),
                Icon(Icons.star_half_sharp, color: Colors.yellow.shade800, size: 20.sp), // Icono adaptado
                SizedBox(width: 3.w),
                Text(
                  '${slide.qualification}',
                  style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800, fontSize: 12.sp), // Adaptado con ScreenUtil
                ),
                SizedBox(width: 15.w),
                const Spacer(),
                Text(
                  HumanFormats.number(slide.qualification),
                  style: textStyle.bodySmall?.copyWith(fontSize: 12.sp), // Adaptado con ScreenUtil
                ),
              ],
            ),
          ),
          //* icon corazon
          SizedBox(
            width: 150.w,
            child: Icon(Icons.favorite, color: Colors.red, size: 15.sp), // Icono adaptado
          ),
        ],
      ),
    );
  }
}

// class _Slide extends StatelessWidget {
//   final CardWorkerSlideData slide;
//   const _Slide({required this.slide});

//   @override
//   Widget build(BuildContext context) {
//     final textStyle = Theme.of(context).textTheme;
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         //* image
//         Container(
//           width: 133,
//           height: 133,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20), color: Colors.white),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: 
//             Image.network(
//               slide.backgroundImage,
//               loadingBuilder: (context, child, loadingProgress) {
//                 if (loadingProgress != null) {
//                   return const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Center(
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                       ),
//                     ),
//                   );
//                 }          
//                 return GestureDetector(
//                   onTap: (){},
//                   child:  FadeIn(child: child),
//                 );      
//               },
//             ),
//             // Image(
//             //   image: AssetImage(slide.backgroundImage),
//             // ),
//           ),
//         ),
//         //* sizebox
//         const SizedBox(
//           height: 8,
//         ),
//         //*title
//         SizedBox(
//           child: Text(
//             slide.shortDescription,
//             maxLines: 1,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//         //*name
//         SizedBox(
//           child: Center(
//             child: Text(
//               slide.profesionalName,
//               maxLines: 1,
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//         //*Rating
//         SizedBox(
//           width: 150,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(width: 45),
//               Icon(Icons.star_half_sharp, color: Colors.yellow.shade800),
//               const SizedBox(
//                 width: 3,
//               ),
//               Text(
//                 '${slide.qualification}',
//                 style: textStyle.bodyMedium
//                     ?.copyWith(color: Colors.yellow.shade800),
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               const Spacer(),
//               Text(
//                 HumanFormats.number(slide.qualification),
//                 style: textStyle.bodySmall,
//               )
//             ],
//           ),
//         ),
//         //* icon corazon
//         const SizedBox(
//           width: 150,
//           child: Icon(Icons.favorite, color: Colors.red,size: 15,)
//         ),
//       ]),
//     );
//   }
// }

// class _Title extends StatelessWidget {
//   final String? title;
//   final String? subTitle;
//   final IconData? icon;
//   const _Title({this.title, this.subTitle,  this.icon});

//   @override
//   Widget build(BuildContext context) {
//     final titleStile = Theme.of(context).textTheme.titleLarge;
//     return Container(
//       padding: const EdgeInsets.only(top: 10, bottom: 10),
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//         if (title != null)
//           Text(
//             title!,
//             style: titleStile,
//           ),
//         const SizedBox(width: 7),
//         if (icon != null)
//         Icon(icon),
//         const Spacer(),
//         if (subTitle != null)
//               FilledButton.tonal(
//               style: const ButtonStyle(visualDensity: VisualDensity.compact),
//               onPressed: () {},
//               child: Text(subTitle!)),
//       ]),
//     );
//   }
// }
class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final IconData? icon;
  const _Title({this.title, this.subTitle, this.icon});

  @override
  Widget build(BuildContext context) {
    final titleStile = Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp); // Adaptado con ScreenUtil
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStile,
            ),
          SizedBox(width: 7.w),
          if (icon != null)
            Icon(icon, size: 24.sp), // Icono adaptado
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle!, style: TextStyle(fontSize: 16.sp)), // Texto adaptado
            ),
        ],
      ),
    );
  }
}

