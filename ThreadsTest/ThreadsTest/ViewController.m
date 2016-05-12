//
//  ViewController.m
//  ThreadsTest
//
//  Created by Artyom Linnik on 08/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"
#import "ALStudent.h"
#import "ALStudentSuperman.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#pragma mark - Level Pupil
    //    Ученик.
    //
    //    1. Создайте класс студент. У него должен быть метод - угадать ответ :)
    //    2. В метод передается случайное целое число например в диапазоне от 0 - 100 (или больше) и сам диапазон, чтобы студент знал где угадывать
    //    3. Студент генерирует случайное число в том же диапазоне пока оно не будет искомым
    //    4. Весь процесс угадывания реализуется в потоке в классе студент
    //    5. Когда студент досчитал то пусть пишет в НСЛог
    //    6. Создайте 5 студентов и дайте им одну и туже задачу и посмотрите кто справился с ней лучше
    
    ALStudent *student1 = [[ALStudent alloc]initWithName:@"Sergey" guessTheNumber:600454 range:1000000];
    ALStudent *student2 = [[ALStudent alloc]initWithName:@"Viktor" guessTheNumber:10 range:10000];
    ALStudent *student3 = [[ALStudent alloc]initWithName:@"Vladimer" guessTheNumber:256 range:10000];
    ALStudent *student4 = [[ALStudent alloc]initWithName:@"Aleksey" guessTheNumber:8500 range:10000];
    ALStudent *student5 = [[ALStudent alloc]initWithName:@"Aleksander" guessTheNumber:1200 range:10000];
    
    NSArray *student1Array = [NSArray arrayWithObjects:student1,student2,student3,student4,student5, nil];
    
    for (ALStudent *obj in student1Array) {
        [obj startTask];
    }
    
#pragma mark - Level Student && Master
    //    Студент.
    //
    //    7. Задача та же, но вместе с условием передавайте студенту блок, в котором вы и объявите результаты
    //    8. Блок должен определяться в томже классе, где и определялись студенты
    //    9. Блок должен быть вызван на главном потоке
    //    Мастер.
    //
    //    10. Создать приватный метод класса (да да, приватный метод да еще и с плюсом), который будет возвращать статическую (то есть одну на все объекты класса студент) dispatch_queue_t, которая инициализируется при первом обращении к этому методу.
    //    11. Лучше в этом методе реализовать блок dispatch_once, ищите в инете как и зачем :) А что, программист всегда что-то ищет и хороший программист всегда находит.
    //    12. Все студенты должны выполнять свои процессы в этой queue и она должна быть CONCURRENT, типа все блоки одновременно выполняются
    
    ALStudent *student6 = [[ALStudent alloc]initWithName:@"Andrey" guessTheNumber:25 range:100];
    ALStudent *student7 = [[ALStudent alloc]initWithName:@"Vitaliy" guessTheNumber:10 range:100];
    ALStudent *student8 = [[ALStudent alloc]initWithName:@"Maksim" guessTheNumber:90 range:100];
    ALStudent *student9 = [[ALStudent alloc]initWithName:@"Arthur" guessTheNumber:85 range:100];
    ALStudent *student10 = [[ALStudent alloc]initWithName:@"Georgiy" guessTheNumber:1 range:100];
    
    NSArray *student2Array = [NSArray arrayWithObjects:student6,student7,student8,student9,student10, nil];
    
    for (ALStudent *obj in student2Array) {
        [obj startTaskWithBlock:^(NSString *str) {
            if ([NSThread isMainThread]) {
                NSLog(@"%@",str);
            }
        }];
    }
    
#pragma mark - Level Superman
    //    Супермен.
    //
    //    13. Добавьте еще один класс студента, который делает все тоже самое что вы реализовали до этого, только вместо GCD он использует NSOperation и NSOperationQueue. Вообще вынос мозга в самостоятельной работе :)
    
    ALStudentSuperman *student11 = [[ALStudentSuperman alloc]initWithName:@"Nikita" guessTheNumber:564 range:1000000];
    ALStudentSuperman *student12 = [[ALStudentSuperman alloc]initWithName:@"Anatoliy" guessTheNumber:2567 range:1000000];
    ALStudentSuperman *student13 = [[ALStudentSuperman alloc]initWithName:@"Igory" guessTheNumber:7895 range:1000000];
    ALStudentSuperman *student14 = [[ALStudentSuperman alloc]initWithName:@"Katya" guessTheNumber:5454 range:1000000];
    ALStudentSuperman *student15 = [[ALStudentSuperman alloc]initWithName:@"Semen" guessTheNumber:1234 range:1000000];
    
    NSArray *student3Array = [NSArray arrayWithObjects:student11,student12,student13,student14,student15, nil];
    
    for (ALStudentSuperman *obj in student3Array) {
        [obj startTask];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
