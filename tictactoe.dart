import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false,
    title:"Tic Tac Toe",
    home:HomePage(),
    ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // To add Icon Image
  var cross = Icon(Icons.cancel, size:80);
  var circle = Icon(Icons.circle , size:80);
  var edit= Icon(Icons.edit, size:80);

  late bool isCrossed=true;
  late String message;
  late List<String> gameState;

    // Intialize box with Empty Value
  @override
  void initState() {
    gameState=List.filled(9,"empty");
    this.message="";
    super.initState();
  }

    // To play game
  playGame(int index) {
    if(this.gameState[index]=="empty") {
      setState(() {
        if(this.isCrossed) {
          this.gameState[index]="cross";
        }
        else
        {
          this.gameState[index]="circle";
        }
        isCrossed=!isCrossed;
         checkhwin();
      });
    }
  }
  // Reset Game 
  resetGame(){
    setState(() {
      gameState=List.filled(9,"empty");
    this.message="";
    });
  }
  // To get Icon Image
  getImage(String title) {   
    switch(title){
    case('empty'):
    return edit;
    break;
 
    case('cross'):
    return cross;
    break;

    case('circle'):
    return circle;
    break;
  };
  }
    // To check for winning 
  checkhwin(){
    if((gameState[0] !="empty") &&
    (gameState[0]==gameState[1]) &&
    (gameState[1]==gameState[2])) {
      setState(() {
        this.message = this.gameState[0] +'win';
      });
    }


    else if((gameState[3] !="empty") &&
    (gameState[3]==gameState[4]) &&
    (gameState[4]==gameState[5])) {
      setState(() {
        this.message = this.gameState[3] +'win';
      });
    }




   else if((gameState[6] !="empty") &&
    (gameState[6]==gameState[7]) &&
    (gameState[7]==gameState[8])) {
      setState(() {
        this.message = this.gameState[6] +'win';
      });
    }
       else if((gameState[0] !="empty") &&
    (gameState[0]==gameState[3]) &&
    (gameState[3]==gameState[6])) {
      setState(() {
        this.message = this.gameState[0] +'win';
      });
    }





    else if((gameState[1] !="empty") &&
    (gameState[1]==gameState[4]) &&
    (gameState[4]==gameState[7])) {
      setState(() {
        this.message = this.gameState[1] +'win';
      });
    }




    else if((gameState[2] !="empty") &&
    (gameState[2]==gameState[5]) &&
    (gameState[5]==gameState[8])) {
      setState(() {
        this.message = this.gameState[2] +'win';
      });
    }




     else if((gameState[0] !="empty") &&
    (gameState[0]==gameState[4]) &&
    (gameState[4]==gameState[8])) {
      setState(() {
        this.message = this.gameState[0] +'win';
      });
    }


    else if((gameState[2] !="empty") &&
    (gameState[2]==gameState[4]) &&
    (gameState[4]==gameState[6])) {
      setState(() {
        this.message = this.gameState[2] +'win';
      });
    } else if(!gameState.contains("empty")) {
      setState(() {
        message="Game Draw";
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("TIC TAC TOE", style:TextStyle(fontSize:25, color:Colors.blue, fontWeight:FontWeight.bold)),
      ),
            body:Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Expanded(
            child:GridView.builder(
              padding:EdgeInsets.all(10),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3,
                childAspectRatio:1,
                ),

               itemCount: gameState.length,
               itemBuilder:(context, index) {
                return SizedBox(
                width:100, 
                height:100,
                child:MaterialButton(
                  color:Colors.blue[800],
                  onPressed:(){
                  this.playGame(index);
                },
                child:getImage(this.gameState[index])
                ),
               );
               },
              ),
          ),
              Text(message, style:TextStyle(fontWeight:FontWeight.bold,fontSize:25, color:Colors.green)),
              ElevatedButton(onPressed: () {
              resetGame();
              minWidth:100;
              },
              child:Text("Reset Game", style:TextStyle(fontSize:20, color:Colors.blue, fontWeight:FontWeight.bold)),
              ),
              SizedBox(height:100),
              Text("#Tilak Bista", style:TextStyle(fontSize:23,color:Colors.black, fontWeight:FontWeight.bold)),

              

       
        ]),
      );
  }
} 


