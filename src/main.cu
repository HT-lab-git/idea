#include <stdio.h>
#include <iostream>
#include "./component/factory.cuh"

int main(void)
{
    char key[18], plainTxt[100];
    std::cout << "-----Please input key:-----" << std::endl;
    
    std::cin.getline(key, 18);

    return 0;
}