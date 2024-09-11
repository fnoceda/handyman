import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PricingCardChatGPT extends StatelessWidget {
  final List<String> features;

  PricingCardChatGPT({required this.features});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
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
          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 220.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                gradient: const LinearGradient(
                  colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enterprise',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$49.50',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Lista de características
          Expanded(
            child: ListView.builder(
              itemCount: features.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.check, color: Colors.blue, size: 20.w),
                  title: Text(
                    features[index],
                    style: TextStyle(fontSize: 16.sp),
                  ),
                );
              },
            ),
          ),
          // Botón "Get Started"
          Padding(
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
                padding: EdgeInsets.symmetric(
                    vertical: 12.h, horizontal: 30.w),
                child: Text('Get Started', style: TextStyle(fontSize: 16.sp)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.5, size.height - 40.h);
    path.lineTo(size.width, size.height - 80.h);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
