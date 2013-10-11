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
#include <time.h>
#include <ctype.h>

using namespace std;

/*
 * 
 */
void fecha(){
  time_t rawtime;
  time (&rawtime);
  cout<<"Integrantes:"<<endl;
  cout<<"Claudio Acuna A"<<endl;
  cout<<"Ricardo Soto O"<<endl;
  cout<<"José Acuna A"<<endl;
  cout<<"La Fecha de Hoy es: "<<ctime(&rawtime);
  cout<<endl;
}

int main(int argc, char** argv) {
    int i=0;
//    cout << "ejecutable"<<argv[0]<<"\n";
//    for (int i = 0; i < argc; i++) {
//        cout<< "Argumento["<<i<<"]:"<<argv[i]<<"\n";
//        }
    
//     int b=1;//Menu para Ejecurtar las Diferentes Funciones de la Tarea
//   
//   int d=1;
//   b=  strcmp(argv[1],"-i");
//   
//   d= strcmp(argv[1],"-g");
//   if(b==0) 
//       cout<<"Ceros del Polinomio";
//   if(d==0)
//       cout<<"Integral";
//-------------------------------------------------Autores---------------------------------------------------------------
   if (argc==2){
       int c=1;
       c=  strcmp(argv[1],"-v");
       if(c==0){
           fecha();
        }
   
   } 
   else{   
 //---------------------------------------------------Integral Simple-------------------------------------------------      
       if(argc==3){
 
       int largocadena=strlen(argv[2]);
   
       for (int i = 0; i < largocadena; i++) {
       cout<<argv[2][i]<<"*";
   
       }
       cout<<endl;
   
       std::string polinomio =argv[2];
   
       int vector [largocadena];
   
       for (int i = 0; i < largocadena; i++) {
        vector[i]=0;
   
       }
   char Letra;

   for (int i = 0; i < largocadena; i++) {//Funcion de Transformacion de String a un Vector
       if(isdigit(polinomio[i])!=0)// comprueba si el elemento es un digito,donde 0 es la condicion falsa.
        {

            Letra = polinomio[i];

            int aux = Letra -48;

        vector[i]=aux;
        }
       cout<<vector[i]<<"*";
       }
 
   cout<<endl;
       
       }
   }
       
 //-------------------------------------------------Integral Definida------------------------------------------------------------      
 if(argc==5)
 
 {
   int largocadena=strlen(argv[2]);
   
       for (int i = 0; i < largocadena; i++) {
       cout<<argv[2][i]<<"*";
   
       }
   cout<<endl;
   
       std::string polinomio =argv[2];
   
       int vector [largocadena];
   
       for (int i = 0; i < largocadena; i++) {
        vector[i]=0;
   
       }
   char Letra;

   for (int i = 0; i < largocadena; i++) {//Funcion de Transformacion de String a un Vector
        
        Letra = polinomio[i];
       
       int aux = Letra -48;
       vector[i]=aux;
       cout<<vector[i]<<"*";
       }
 
   cout<<endl;
       
    int limiteinferior = atoi(argv[3]);
    int limitesuperior = atoi(argv[4]);
    
    cout<<"Limite Inferior: "<<limiteinferior<<endl;
    cout<<"Limite Superior: "<<limitesuperior<<endl;
 
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

