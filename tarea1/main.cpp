/* 
 * File:   main.cpp
 * Author: claudio
 *
 * Created on 7 de octubre de 2013, 11:10 PM
 */

#include <cstdlib>
#include <iostream>
#include <stdio.h>
#include <string.h>
using namespace std;

/*
 * 
 */
void Separador(){
    
}

int main(int argc, char** argv) {
    int i=0;
    cout << "ejecutable"<<argv[0]<<"\n";
    for (int i = 0; i < argc; i++) {
        cout<< "Argumento["<<i<<"]:"<<argv[i]<<"\n";
        }
   int largocadena=strlen(argv[2]);
   cout<<largocadena<<"\n";
   cout<<"----------------------"<<endl;
   for (int i = 0; i < largocadena; i++) {
       cout<<argv[2][i]<<"\n";
   }
   cout<<"-----------------------"<<endl;
   std::string polinomio =argv[2];
   int b=1;
   int c=1;
   int d=1;
   b=  strcmp(argv[1],"-i");
   c=  strcmp(argv[1],"-v");
   d= strcmp(argv[1],"-g");
   if(b==0) 
       cout<<"Ceros del Polinomio";
   if(d==0)
       cout<<"Integral";
  if(c==0){
      cout<<"Claudio Acuña";
  }
   
//   cout<<polinomio;
//   cout<<"\n"<<cout<<"----------------------"<<endl;
//   int polinomioentero;
//   polinomioentero = atoi(polinomio.c_str());
//   cout <<polinomioentero<<endl;
//int gradopolinomio= (char)argv[2][2];
//cout <<"grado = "<<gradopolinomio;   
    return 0;
}

