import "package:flutter/material.dart";
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   String? _Usertodo;
  List todolist = [];

  void initState(){

    super.initState();
  todolist.addAll(["Buy milk","Wash dishes","Play games" ]);
  }
void _menuOpen(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext Context){
        return Scaffold(
          appBar: AppBar(
            title: Text("menu"),),
          body : Row(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context,"/", (route) => false);
              }, child: Text("To main"),),
              Padding(padding:EdgeInsets.only(left:15)),
              Text("Simple Menu")
            ],
          )
        );
      })
    );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
  appBar: AppBar(
 title: Text("Tasks"),
 centerTitle: true,
 actions: [
   IconButton(
     icon: Icon(Icons.menu_outlined),

       onPressed: _menuOpen,
   )
 ],   
  ),    
      body: ListView.builder(
          itemCount: todolist.length,
          itemBuilder:(BuildContext, int index) {
            return Dismissible(
              key: Key(todolist[index]),
              child: Card(
                child: ListTile(
                    title: Text(todolist[index]),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_sweep,
                    color: Colors.deepOrangeAccent
                  ),
                  onPressed:(){
                    setState(() {
                      todolist.removeAt(index);
                    });
                  },
                ),
              ),
              ),
              onDismissed: (direction) {
                //if(direction==DismissDirection.endToStart)
                setState(() {
                  todolist.removeAt(index);
                });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: (){
       showDialog(context: context, builder: (BuildContext context){
  return AlertDialog(
    title: Text("Add elements"),
      content: TextField(
        onChanged: (String value){
_Usertodo = value;
        },
      ),
    actions: [
      ElevatedButton(onPressed: (){
        setState(() {
          todolist.add(_Usertodo);
        });
        Navigator.of(context).pop();
      }, child: Text("Add"))
    ],
  );
});
        },
        child: Icon(
          Icons.add_box,
          color: Colors.white
        )
      ),
    );
  }
}//HOME DART TO DO LIST WITH NAVIGATION 


