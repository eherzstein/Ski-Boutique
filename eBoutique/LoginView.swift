//
//  LoginView.swift
//  eBoutique
//
//  Created by Erin Herzstein on 2021-05-28.
//  Copyright © 2021 Erin Herzstein. All rights reserved.
//

import SwiftUI
struct LoginView: View {
    @State var showingSignup = false // pour alterner entre sign in et sign up
    @State var showingFinishReg = false
    @State var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    @State var email = ""
    @State var password = ""
    @State var repeatPassword = ""
    @State var message = ""
    
    var body: some View {
        VStack {
            Text("Sign In")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.bottom, .top], 20)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    TextField("Enter your email", text: $email)
                    Divider()
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    
                    SecureField("Enter your password", text: $password)
                    Divider()
                    
                    if showingSignup {
                        Text("Repeat Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label))
                            .opacity(0.75)
                        
                        SecureField("Repeat password", text: $repeatPassword)
                        Divider()
                    }
                }
                .padding(.bottom, 15)
                .animation(.easeOut(duration: 0.1))
                //Fin du VStack
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        self.showingAlert.toggle()
                        self.resetPassword()
                    }, label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color.gray.opacity(0.5))
                    })
                    .alert(isPresented: $showingAlert) {
                                   Alert(title: Text(message), dismissButton: .default(Text("OK")))
                                   }
                }//Fin du HStack
                
            } .padding(.horizontal, 6)
            //Fin du VStack
            Button(action: {
                self.showingAlert.toggle()
                self.showingSignup ? self.signUpUser() : self.loginUser()
            }, label: {
                Text(showingSignup ? "Sign Up" : "Sign In")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
            }) //Fin du  Button
                .alert(isPresented: $showingAlert) {
                Alert(title: Text(message), dismissButton: .default(Text("OK")))
                }
                .background(Color.blue)
                .clipShape(Capsule())
                .padding(.top, 45)
            
            SignUpView(showingSignup: $showingSignup)
        }//Fin du VStack
        .sheet(isPresented: $showingFinishReg)
        {
            FinishRegistrationView()
        }
        
    }//Fin du body

    private func loginUser()
    {
        if email != "" && password != "" {
                    FUser.loginUserWith(email: email, password: password) { (error, isEmailVerified) in
                        
                        if error != nil {
                            
                            self.message = "Error logging in the user: " + error!.localizedDescription
                            print("error logging in the user: ", error!.localizedDescription)
                            return
                        } else {
                            self.message = "Logged in successfully"
                        }
                        //permettre d'ouvrir la fenêtre pour finaliser l'enregistrement si ce n'est pas encore fait
                        if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding {
                            self.presentationMode.wrappedValue.dismiss() // fermer la fenêtre qui est en mode présentation
                        } else {
                            self.showingFinishReg.toggle()
                           // self.message = "Logged in successfully"
                        }
                    }
                }

        
    }
    private func signUpUser()
    {
       message = ""
        if email != "" && password != "" && repeatPassword != "" {
            if password == repeatPassword {
                
                FUser.registerUserWith(email: email, password: password) { (error) in
                    
                    if error != nil {
                        self.message = "Error registering user: " + error!.localizedDescription
                        print("Error registering user: ", error!.localizedDescription)
                        return
                    }
                    self.message = "Thank you for signing up. Please check your email to confirm and claim your account."
                    print("user has been created")
                    //retourner à l'application
                    //vérifier si onBoard a été fait
                }

                
            } else {
                message = "Passwords dont match"
                print("passwords dont match")
            }
            
            
        } else {
            message = "Email and password must be set"
            print("Email and password must be set")
        }
        
//        if !email.contains("@") || !email.contains(".") {
//            message = "Invalid email"
//        }
    }
    private func resetPassword()
    {
        if email != ""
        {
            FUser.resetPassword(email: email)
            {(error) in
                if error != nil
                {
                    self.message = "Error sending reset password: " + error!.localizedDescription
                    print("error sending reset password,",error!.localizedDescription)
                    return
                }
                self.message = "Please check your email to reset password"
                print ("Please check your email")
            }
        }
        else
        {
            self.message = "Email is empty"
            print("email is empty")
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct SignUpView : View {
    @Binding var showingSignup: Bool
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 8) {
                Text("Don't have an Account?")
                    .foregroundColor(Color.gray.opacity(0.5))
                Button(action: {
                    self.showingSignup.toggle()
                }, label: {
                    Text("Sign Up")
                })
                    .foregroundColor(.blue)
            }//Fin de HStack
                .padding(.top, 25)
        } //Fin de VStack
    }
}
