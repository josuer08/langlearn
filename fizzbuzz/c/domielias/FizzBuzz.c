//Contributor: Domielias
#include <stdio.h>
void isFizzBuzz(int number);

int main(){
  for(int number=1;number<101;number++)
      isFizzBuzz(number);
}
void isFizzBuzz(int number){
  if(number%3==0 && number%5==0)
    printf("%d FizzBuzz\n",number);
  else if(number%3==0)
    printf("%d Fizz\n",number);
  else if(number%5==0)
    printf("%d Buzz\n",number);
}