import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:handiman_v0/core/config/helpers/human_formats.dart';
import 'package:handiman_v0/feacture/home/domain/entities/card_slide_data.dart';

class MovieHorizontalListView extends StatefulWidget {
  final List<CardSlideData> slides;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView({
      super.key,
      required this.slides,
      this.title,
      this.subTitle,
      this.loadNextPage
      });

  @override
  State<MovieHorizontalListView> createState() => _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {
  final scrollcontroller = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollcontroller.addListener(() {

      if(widget.loadNextPage ==null) return;

      if((scrollcontroller.position.pixels + 200) >= scrollcontroller.position.maxScrollExtent ){
        widget.loadNextPage!();
      }
      
    });


  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),
          Expanded(
              child: ListView.builder(
                controller: scrollcontroller,
            itemCount: widget.slides.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(child: _Slide(slide: widget.slides[index]));
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final CardSlideData slide;
  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //* image
        SizedBox(
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: 
            // Image.network(
            //   slide.backgroundImage,
            //   fit: BoxFit.cover,
            //   width: 150,
            //   loadingBuilder: (context, child, loadingProgress) {
            //     if (loadingProgress != null) {
            //       return const Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: Center(
            //           child: CircularProgressIndicator(
            //             strokeWidth: 2,
            //           ),
            //         ),
            //       );
            //     }
            //     return GestureDetector(
            //       // onTap: ()=> context.push('/home/0/movie/${movie.id}'),
            //       onTap: () {},
            //       child:  FadeIn(child: child),
            //     );
                
            //   },
            // ),
            Image(image: AssetImage(slide.backgroundImage)),
          ),
        ),
        //* sizebox
        const SizedBox(
          height: 5,
        ),
        //*title
        SizedBox(
          width: 150,
          child: Text(
            slide.shortDescription,
            maxLines: 1,
            style: textStyle.titleSmall,
          ),
        ),
        //*Rating
        SizedBox(
          width: 150,
          child: Row(
            children: [
              Icon(Icons.star_half_sharp, color: Colors.yellow.shade800),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${slide.qualification}',
                style: textStyle.bodyMedium
                    ?.copyWith(color: Colors.yellow.shade800),
              ),
              const SizedBox(
                width: 10,
              ),
             const Spacer(),
              Text(
                HumanFormats.number(slide.qualification),
                style: textStyle.bodySmall,
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStile = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        if (title != null)
          Text(
            title!,
            style: titleStile,
          ),
        const Spacer(),
        if (subTitle != null)
          FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle!)),
      ]),
    );
  }
}
