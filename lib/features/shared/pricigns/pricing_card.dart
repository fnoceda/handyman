import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PricingCard extends StatelessWidget {
  final MapSlideData slideData;

  const PricingCard({super.key, required this.slideData});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return Container(
      width: 300.w,
      height: 550.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.r,
            spreadRadius: 5.r,
          ),
        ],
      ),
      child: Column(
        children: [
          // Encabezado con degradado y borde superior redondeado
          _PriceText(data: slideData),
          // Lista de características
          _ListTexIcon(features: slideData.listData),
          // Botón "Get Started"
          const _ButtonConfirm(),
        ],
      ),
    );
  }
}

class _PriceText extends StatelessWidget {
  final MapSlideData data;
  const _PriceText({required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(),
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          gradient: const LinearGradient(
            stops: [
              0.0,
              0.8,
            ],
            colors: [Color.fromARGB(255, 46, 42, 42), Color(0xFF3B8FC7)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            Text(
              data.planName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            _Price(
              price: data.price,
            ),
          ],
        ),
      ),
    );
  }
}

class _Price extends StatelessWidget {
  final double price;
  const _Price({
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    String priceString = price.toStringAsFixed(2);
    List<String> parts = priceString.split('.');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 15,
          height: 50,
          child: Text(
            '\$', // Parte entera del precio
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          parts[0], // Parte entera del precio
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '.${parts[1]}', // Parte decimal con un tamaño más pequeño
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp, // Tamaño más pequeño para la parte decimal
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _ButtonConfirm extends StatelessWidget {
  const _ButtonConfirm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
          child: Text('Get Started',
              style: TextStyle(fontSize: 16.sp, color: Colors.white)),
        ),
      ),
    );
  }
}

class _ListTexIcon extends StatelessWidget {
  final List<MessageOption> features;
  const _ListTexIcon({
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: features.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                ListTile(
                    trailing: (features[index].icon != null)
                        ? Icon(features[index].icon,
                            color: Colors.blue, size: 20.w)
                        : const SizedBox(),
                    title: Center(
                      child: Text(features[index].text,
                          style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold)),
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Divider(
                    height: 0.2, // Altura de la línea
                    color: Colors.black, // Color de la línea
                    thickness: 0.2, // Grosor de la línea
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.4, size.height - 30.h);
    path.lineTo(size.width, size.height - 75.h);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MessageOption {
  final String text;
  final IconData? icon;

  MessageOption({required this.text, this.icon});
}

class MapSlideData {
  final String planName;
  final double price;
  final List<MessageOption> listData;

  MapSlideData({
    required this.planName,
    required this.price,
    required this.listData,
  });
}
