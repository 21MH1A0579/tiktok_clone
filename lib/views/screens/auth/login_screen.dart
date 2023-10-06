import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/auth/signup_screen.dart';
import 'package:tiktok_clone/views/widgets/text_input.dart';
class LoginScreen extends StatelessWidget {
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
   LoginScreen({super.key});

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
              "Login",
              style: TextStyle(
                  fontSize: 25,
                fontWeight: FontWeight.w700,
            )
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
                onTap: ()=>.LogiauthControlleruser(_emailcontroller.text, _passwordcontroller.text),
                  child:
                  const Center(
                      child: Text("Login",
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
                Text("don\'t have account?",style: TextStyle(fontSize: 20),),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                  },
                    child: Text("Regitser",
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
