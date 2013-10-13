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
int CuentaSuma(string ingreso){
    int cuenta=0;

    for(int i =0; i < ingreso.size(); i++)
    {
        if(ingreso[i]=='+')
            cuenta++;
    }
    return cuenta;
}
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
//void coefintegral(int coef,int exp){
//    char s;
//    
//    s = coef / grado;
//}
void integrar(int coeficiente[],int tamano ,int grado, char simbolo[])
{
//   char auxcoef[tamano]; 
   int auxexp[tamano];
   int x= grado+1;
   
    for (int i = 0; i < tamano; i++ && (simbolo[i]=='+' || simbolo[i]=='-' )) {
//        auxcoef[i]=coeficiente[i]/ x;
        if(coeficiente[i]!=0)
        cout <<coeficiente[i]<<"/"<< x<<"x^"<<x<<simbolo[i];
        auxexp[i]=x;
        x--;
    }
   
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

       char *poli =strdup(polinomio.c_str());
       int vector [largocadena];
   
       for (int i = 0; i < largocadena; i++) {
        vector[i]=0;
   
       }
       int grado;
       int cuenta=0;
              for (int i = 0; i < largocadena ;i++) 
       {
                
                if(poli[i]=='^'){
                    grado=poli[i+1]-48;
                    i=largocadena;
                }

        }
       
       cout<<grado;
       cout<<endl;
     char simbolo[grado];
      int k=0;
       for (int i = 0; i < largocadena ;i++) 
       {
                cout<<poli[i]<<"*";
                if(poli[i]=='+' || poli[i]=='-')
                {
                    simbolo[k]=poli[i];
                k++;
                    poli[i]=' ';
                
                }
        }
       
       cout<<endl;
       
       for (int i = 0; i <grado; i++) {
                cout<<"[ "<<simbolo[i]<<" ]";


            }
       cout<<endl;

         for (int i = 0; i < largocadena ;i++) 
       {
                cout<<poli[i]<<"*";
                if(poli[i]=='^')
                {
                    poli[i]=' ';
                    poli[i+1]=' ';
                }
                

        }
       cout<<endl;
//       int contador=0;
//        for (int i = 0; i < largocadena ;i++) 
//       {
//               
//                if(poli[i]==' ')
//           {
//                    contador++;
//                    
//          }
//                
//
//        }

          for (int i = 0; i < largocadena ;i++) //Transforma a un vector con puros signos
       {
               
                if(poli[i]!=' ')
           {
                    vector[i]=poli[i]-48;
                    
          }
                cout<<vector[i]<<"*";

        }
       
       cout<<endl;
       for (int i = 0; i < largocadena ;i++) 
       {
                cout<<poli[i]<<"*";

        }
       cout<<endl;
//       
//       int contador=0;
//       for (int i = 0; i < largocadena; i++) {
//                if(vector[i]==0)
//                    contador++;
//
//
//        }
//       cout<<contador<<" Tamaño del vector";
//       cout<<endl;
//       
       
       int vector2[largocadena];
       for (int i = 0; i < largocadena; i++) {
                vector2[i]=0;

                cout<<vector2[i]<<"-";
          }
       cout<<endl;
        int aux=0;
       for (int i = 0; i < largocadena; i++) 
       {
          
           if (vector[i]!=0) {
               vector2[aux]=vector[i];
               aux++;

                }
        }
        //Funcion comprobar
        for (int i = 0; i < largocadena; i++) {
                if(vector2[i]==72 || vector2[i]==73)
                    if(vector2[i]==vector2[i+i])
                    {
                        vector2[i]=0;
                        vector2[i+1]=1;
                    }   
                    else
                        vector2[i]=0;


            }

        cout<<"Vector 2 = ";
       for (int i = 0; i < largocadena; i++) {
                cout<<vector2[i]<<" ";


            }
        cout<<endl;

//               int contador=0;
//       for (int i = 0; i < largocadena; i++) {
//                if(vector2[i]!=0)
//                    contador++;
//
//
//        }
//       cout<<contador<<" Tamaño del vector";
//       cout<<endl;
//      
       int vector3[largocadena];
       
       for (int i = 0; i < largocadena; i++) {
                vector3[i]= 0;


            }
       
       int aux2=0;
       for (int i = 0; i < largocadena; i++) {
           if(vector2[i]!=0){ 
               
           vector3[aux2] = vector2[i];
                aux2++;
               
           }
            }

       cout<<"Vector 3  Coeficientes = ";
       for (int i = 0; i < largocadena; i++) {
                cout<<vector3[i]<<" ";


            }
       cout<<endl;

       cout<<"el grado = "<<grado<<endl;

       integrar(vector3 ,largocadena ,grado,simbolo );
            }


   
       
     
   
//   char Letra;
//
//   for (int i = 0; i < largocadena; i++) {//Funcion de Transformacion de String a un Vector
//       if(isdigit(polinomio[i])!=0)// comprueba si el elemento es un digito,donde 0 es la condicion falsa.
//        {
//
//            Letra = polinomio[i];
//
//            int aux = Letra -48;
//
//        vector[i]=aux;
//        }
//       cout<<vector[i]<<"*";
//       }
// 
//   cout<<endl;
       
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

       char *poli =strdup(polinomio.c_str());
       int vector [largocadena];
   
       for (int i = 0; i < largocadena; i++) {
        vector[i]=0;
   
       }
       int grado;
       int cuenta=0;
              for (int i = 0; i < largocadena ;i++) 
       {
                
                if(poli[i]=='^'){
                    grado=poli[i+1]-48;
                    i=largocadena;
                }

        }
       
       cout<<grado;
       cout<<endl;
       char simbolo[grado];
      int k=0;
       for (int i = 0; i < largocadena ;i++) 
       {
                cout<<poli[i]<<"*";
                if(poli[i]=='+' || poli[i]=='-')
                {
                    simbolo[k]=poli[i];
                     k++;       
                    poli[i]=' ';
                }
                

        }
      for (int i = 0; i < grado; i++) {
          cout<<"Prueba"<<endl;
            cout<<"[ "<<simbolo[i]<<" ]"<<endl;


        }
       
       cout<<endl;
         for (int i = 0; i < largocadena ;i++) 
       {
                cout<<poli[i]<<"*";
                if(poli[i]=='^')
                {
                    poli[i]=' ';
                    poli[i+1]=' ';
                }
                

        }
       cout<<endl;
//       int contador=0;
//        for (int i = 0; i < largocadena ;i++) 
//       {
//               
//                if(poli[i]==' ')
//           {
//                    contador++;
//                    
//          }
//                
//
//        }

          for (int i = 0; i < largocadena ;i++) //Transforma a un vector con puros signos
       {
               
                if(poli[i]!=' ')
           {
                    vector[i]=poli[i]-48;
                    
          }
                cout<<vector[i]<<"*";

        }
       
       cout<<endl;
       for (int i = 0; i < largocadena ;i++) 
       {
                cout<<poli[i]<<"*";

        }
       cout<<endl;
//       
//       int contador=0;
//       for (int i = 0; i < largocadena; i++) {
//                if(vector[i]==0)
//                    contador++;
//
//
//        }
//       cout<<contador<<" Tamaño del vector";
//       cout<<endl;
//       
       
       int vector2[largocadena];
       for (int i = 0; i < largocadena; i++) {
                vector2[i]=0;

                cout<<vector2[i]<<"-";
          }
       cout<<endl;
        int aux=0;
       for (int i = 0; i < largocadena; i++) 
       {
          
           if (vector[i]!=0) {
               vector2[aux]=vector[i];
               aux++;

                }
        }
        //Funcion comprobar
        for (int i = 0; i < largocadena; i++) {
                if(vector2[i]==72 || vector2[i]==73)
                    if(vector2[i]==vector2[i+i])
                    {
                        vector2[i]=0;
                        vector2[i+1]=1;
                    }   
                    else
                        vector2[i]=0;


            }

        cout<<"Vector 2 = ";
       for (int i = 0; i < largocadena; i++) {
                cout<<vector2[i]<<" ";


            }
        cout<<endl;

//               int contador=0;
//       for (int i = 0; i < largocadena; i++) {
//                if(vector2[i]!=0)
//                    contador++;
//
//
//        }
//       cout<<contador<<" Tamaño del vector";
//       cout<<endl;
//      
       int vector3[largocadena];
       
       for (int i = 0; i < largocadena; i++) {
                vector3[i]= 0;


            }
       
       int aux2=0;
       for (int i = 0; i < largocadena; i++) {
           if(vector2[i]!=0){ 
               
           vector3[aux2] = vector2[i];
                aux2++;
               
           }
            }

       cout<<"Vector 3  Coeficientes = ";
       for (int i = 0; i < largocadena; i++) {
                cout<<vector3[i]<<" ";


            }
       cout<<endl;

       cout<<"el grado = "<<grado<<endl;

       cout<<"la Integral Es: " ;
       integrar(vector3 ,largocadena ,grado,simbolo );
            
 
//   int largocadena=strlen(argv[2]);
//   
//       for (int i = 0; i < largocadena; i++) {
//       cout<<argv[2][i]<<"*";
//   
//       }
//   cout<<endl;
//   
//       std::string polinomio =argv[2];
//   
//       int vector [largocadena];
//   
//       for (int i = 0; i < largocadena; i++) {
//        vector[i]=0;
//   
//       }
//   char Letra;
//
//   for (int i = 0; i < largocadena; i++) {//Funcion de Transformacion de String a un Vector
//        
//        Letra = polinomio[i];
//       
//       int aux = Letra -48;
//       vector[i]=aux;
//       cout<<vector[i]<<"*";
//       }
// 
//   cout<<endl;
       
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

