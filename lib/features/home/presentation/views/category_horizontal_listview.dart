import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:handiman_v0/features/home/domain/entities/card_worker_slide_data.dart';

class CategoryHorizontalListView extends StatefulWidget {
  final List<CardWorkerSlideData> slides;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  final IconData? icon;

  const CategoryHorizontalListView({
      super.key,
      required this.slides,
      this.title,
      this.icon,
      this.subTitle,
      this.loadNextPage
      });

  @override
  State<CategoryHorizontalListView> createState() =>
      _CategoryHorizontalListViewState();
}

class _CategoryHorizontalListViewState extends State<CategoryHorizontalListView> {
  final scrollcontroller = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollcontroller.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollcontroller.position.pixels + 200) >=
          scrollcontroller.position.maxScrollExtent) {
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
      height: 190,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle, icon: widget.icon,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
              controller: scrollcontroller,
              itemCount: widget.slides.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeInRight(child: _Slide(slide: widget.slides[index]));
              },
                        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
      children: [
        //* image
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80), color: Colors.white),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              width: 60,
              height: 60,
              image: AssetImage(slide.backgroundImage),
            ),
          ),
        ),
        //* sizebox
        const SizedBox(
          height: 8,
        ),
        //*title
        Center(
          child: Text(
            slide.shortDescription,
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
          ),
        ),        
      ]),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final IconData? icon;
  const _Title({this.title, this.subTitle,  this.icon});

  @override
  Widget build(BuildContext context) {
    final titleStile = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        if (title != null)
          Text(
            title!,
            style: titleStile,
          ),
        const SizedBox(width: 7),
        if (icon != null)
        Icon(icon),
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
