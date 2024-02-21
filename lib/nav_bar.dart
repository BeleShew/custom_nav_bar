import 'package:flutter/material.dart';
class CustomNavCar extends StatefulWidget {
   CustomNavCar({super.key,this.isTextEnabled=false,this.notchBottomAppBar=false});
  bool isTextEnabled=false;
  bool notchBottomAppBar=false;
  @override
  State<CustomNavCar> createState() => _CustomNavCarState();
}

class _CustomNavCarState extends State<CustomNavCar> {
  int tabIndex=0;
  List<NavBarModel>model=[
    NavBarModel(Icons.home,"Home"),
    NavBarModel(Icons.search,"Search"),
    NavBarModel(Icons.settings,"Setting"),
    NavBarModel(Icons.person,"Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    return widget.notchBottomAppBar?
        BottomAppBar(
          notchMargin: 5,
          shape: const CircularNotchedRectangle(),
          color: Colors.green.withOpacity(0.7),
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:List.generate(model.length, (index) =>
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        tabIndex=index;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        index==2?const SizedBox(width: 25,):Container(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(model[index].icon,
                              size: 35,
                              color: tabIndex==index?Colors.white:Colors.white.withOpacity(0.4),),
                            widget.isTextEnabled?Text(model[index].name,
                              style: TextStyle(
                                color:tabIndex==index? Colors.white:Colors.white.withOpacity(0.4),
                              ),
                            ):Container()
                          ],
                        ),
                        index==1?const SizedBox(width: 25,):Container(),                    ],
                    ),
                  ),
              ),
            ),
          ),
        ) : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 3),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:List.generate(model.length, (index) =>
                GestureDetector(
                  onTap: (){
                    setState(() {
                      tabIndex=index;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      index==2?const SizedBox(width: 25,):Container(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(model[index].icon,
                            size: 35,
                            color: tabIndex==index?Colors.white:Colors.white.withOpacity(0.4),),
                          widget.isTextEnabled?Text(model[index].name,
                            style: TextStyle(
                                color:tabIndex==index? Colors.white:Colors.white.withOpacity(0.4),
                            ),
                          ):Container()
                        ],
                      ),
                      index==1?const SizedBox(width: 25,):Container(),                    ],
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
class NavBarModel{
  IconData icon;
  String name;
  NavBarModel(this.icon, this.name);
}
