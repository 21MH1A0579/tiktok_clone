import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/widgets/text_input.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
  final TextEditingController _usernamecontroller=TextEditingController();
   SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TickTok Clone",
              style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900
              ),
            ),
            const Text(
                "Register",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                )
            ),
            const  SizedBox(height: 25,),
            Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage("https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1693376602~exp=1693377202~hmac=fa56130a0e83933d9219e828012318e4b95d302bcb4d5497be001a145c928441"),
                ),
                Positioned(
                    left: 80,
                    bottom: -10,
                    child: IconButton(
                      onPressed: ()=>authController.pickimage(),
                       icon:Icon(Icons.add_a_photo),
                    )
                )
              ],
            ),
            const  SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputFeild(controller: _usernamecontroller,labeltext: "Username",icon: Icons.person,),
            ),
            const  SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputFeild(controller: _emailcontroller,labeltext: "Email",icon: Icons.email,),
            ),
            const  SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputFeild(controller: _passwordcontroller,labeltext: "Password",icon: Icons.lock,isObscure: true,),
            ),
            const  SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width-40,
              height: 50,
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )
              ),
              child: InkWell(
                  onTap: ()=>authController.registerUser(_usernamecontroller.text, _emailcontroller.text, _passwordcontroller.text, authController.profilephoto),
                  child:
                  const Center(
                      child: Text("Register",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      )
                  )
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?",style: TextStyle(fontSize: 20),),
                InkWell(
                    onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Text(" Login",
                      style:TextStyle(
                          fontSize: 20,
                          color: buttonColor),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
