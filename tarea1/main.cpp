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
    
  
    return 0;
}

