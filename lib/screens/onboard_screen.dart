import 'package:eorganic/screens/signin_screen.dart';
import 'package:eorganic/widgets/my_theme.dart';
import 'package:eorganic/widgets/onboard_screen_widgets/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentPage = 0;
  late PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashContent = [
      {
        "text": 'welcome to ecmmerce application',
        "image": 'assets/image/myapp.svg'
      },
      {
        "text": 'welcome to ecmmerce application',
        "image": 'assets/image/healthoptions.svg'
      },
      {
        "text": 'welcome to ecmmerce application',
        "image": 'assets/image/shopping.svg'
      }
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: splashContent.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Details(
                      texttitle: splashContent[index]['text'],
                      image: splashContent[index]['image'],
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashContent.length,
                        (index) => onPageChange(index: index),
                      ),
                    ),
                    const SizedBox(height: 180),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: continueButton(index: currentPage),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer onPageChange({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(left: 10),
      height: 8,
      width: currentPage == index ? 30 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? MyTheme.green : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(milliseconds: 500),
    );
  }

  Container continueButton({required int index}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            currentPage != 2
                ? pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInSine)
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const SignInScreen();
                    }),
                  );
          });
        },
        child: const Text(
          'continue',
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }


  
}
