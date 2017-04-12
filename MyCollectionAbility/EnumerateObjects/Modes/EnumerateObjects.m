//
//  EnumerateObjects.m
//  MyCollectionAbility
//
//  Created by mac on 16/11/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "EnumerateObjects.h"

@implementation EnumerateObjects

/*
 代码来源：http://www.jianshu.com/p/d6ef96c862ca
 iOS开发遍历集合(NSArray，NSDictionary、NSSet)方法总结
 
 */


- (void)enumerateObjects{
    [self forthMethod];
}



//for循环来遍历
- (void)firstMethods{
    
    
    //遍历数组
    NSArray *iosArray = @[@"L", @"O", @"V", @"E", @"I", @"O", @"S"];
    for (int i = 0; i < iosArray.count; i++) {
        //处理数组中数据
        NSLog(@"%@", iosArray[i]);
        
    }
    
    //遍历字典
    NSDictionary *dict = @{@"1":@"11", @"2":@"22", @"3":@"33"};
    
    NSArray *keysArray = [dict allKeys];
    
    for (int i = 0; i < keysArray.count; i++) {
        
        //根据键值处理字典中的每一项
        
        NSString *key = keysArray[i];
        
        NSString *value = dict[key];
        
        NSLog(@"%@", value);
        
    }
   
    
//    我们知道字典和set是无序的，所以我们无法根据特定的整数下标来直接访问其中的值，于是需要先获取字典中的键或者set中的所有对象，这样就可以在获取到的有序数组上进行遍历了。然而创建数组是要额外的开销的，还会多创建出一个数组对象，他会保留collection中的所有对象，占用了内存。
//    
//    总结优缺点：
//    
//    优点：被广泛使用，容易接受，操作简单；
//    
//    缺点：遍历字典和set是比较繁琐，会占用比较多的系统资源。
    
}



//    第二种方式：NSEnumerator
- (void)secondMethod{
    
//    第二种方式：NSEnumerator
//    NSEnumerator是一个抽象基类，其中定义了2个方法，使其子类实现：
//    
//    - (nullable ObjectType)nextObject;
//    
//    @property (readonly, copy) NSArray*allObjects;
//    
//    其中nextObject是关键方法，它返回枚举里的下一个对象。每次调用改方法其，其内部结构都会更新，使得下一次调用方法时能返回下一个对象。等到枚举中全部的对象都已经返回之后，在调用就会返回nil，表示达到了枚举的末端。
//    
//    Foundation框架中的collection都实现了这种遍历方式，例如：
//    
    NSArray *iosArray = @[@"L", @"O", @"V", @"E", @"I", @"O", @"S"];
    
    NSEnumerator *enumerator = [iosArray objectEnumerator];//正向遍历
    
//    NSEnumerator *enumerator = [iosArray reverseObjectEnumerator];//反向遍历
    
    id object;
    
    while ((object = [enumerator nextObject]) != nil) {
        
        //处理枚举器中的数据
        
        NSLog(@"%@", object);
        
    }
//    字典和set实现的方式相似，不同的是字典中有key和value，要根据具体的key取出value。同时提供了正向遍历和反向遍历。
//    
//    总结优缺点：
//    
//    优点：代码更易读，不需要定义额外的数组；
//    
//    缺点：1、无法直接获取遍历操作的下标，需要另外声明变量记录；
//    
//         2、需要自行创建NSEnumerator对象，稍显麻烦。
//
//         3、无法更改数组中的元素
    
}


//    第三种方式：快速遍历
- (void)thirdMethod{
    
//    第三种方式：快速遍历
//    Objective-C 2.0引入了快速遍历这一功能，快速遍历与NSEnumerator差不多，然而语法更为简洁，它为for循环开设了in关键字，简化了遍历collection所需的语法，例如遍历数组：
    
        NSArray *iosArray = @[@"L", @"O", @"V", @"E", @"I", @"O", @"S"];
    
    for (NSString *obj in iosArray) {
        
        //处理数组中的数据
        
        NSLog(@"%@", obj);
        
    }
    
    
//    遍历字典也同样简单：
    
    NSDictionary *dict = @{@"1":@"11", @"2":@"22", @"3":@"33"};
    
    for (NSString *key in dict) {
        
        //处理字典的键值
        
        NSString *value = dict[key];
        
        NSLog(@"%@", value);
        
    }
//    反向遍历可以使用for (NSString *obj in [iosArray reverseObjectEnumerator])
    
//        总结优缺点：
//        
//        优点：语法简洁，使用方便，效率高；
//        
//        缺点：1、无法方便获取当前遍历的下标；
//        
//             2、无法在遍历过程中修改被遍历的collection，否则会导致崩溃。
    
}






//第四种方式：基于块的遍历方式
- (void)forthMethod{
//    第四种方式：基于块的遍历方式
//    这才是本文的重点，也是笔者极力推荐使用的方法，苹果封装了如此高效、优雅、易用的一套接口不用多么浪费。
//    
//    遍历数组：
    
    NSArray *iosArray = @[@"L", @"O", @"V", @"E", @"I", @"O", @"S"];
    
    [iosArray enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"%@", obj);
        
        if ([obj isEqualToString:@"E"]) {
            
            *stop = YES;
            
        }
        
    }];
    
//    参数说明：obj表示数组中的元素，idx表示元素的下标，*stop可以控制遍历何时停止，在需要停止时令*stop = YES即可（不要忘记前面的*）。
//    
//    这种方法清晰明了，数组元素，下标都可直接获取，就连何时停止都很容易实现，break都可以退休了，遍历字典也同样简单。
//
    
    
    
    
//    遍历字典：
    
    NSDictionary *dict = @{@"1":@"11", @"2":@"22", @"3":@"33"};
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"%@", obj);
        
        if ([obj isEqualToString:@"22"]) {
            
            *stop = YES;
            
        }
        
    }];
    
//    你没有看错，就是这么简单，block直接把字典的key和value都给我们了，再也不用书写直白而繁琐的代码了。
//    
//    注意：
//    
//    若已知collection里对象的数据类型，可以修改块签名，知道对象的精确类型后，编译器就可以检测开发者是否调用了该对象所不具有的方法，并在发现问题时报错。
    
//    NSDictionary *dict = @{@"1":@"11", @"2":@"22", @"3":@"33"};
    
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
        
        NSLog(@"%@", obj);
        
        if ([obj isEqualToString:@"22"]) {
            
            *stop = YES;
            
        }
        
    }];
//    如代码，直接把key和value的类型修改成NSString类型。
//    
//    反向遍历：
//
    
    
    
    
    
    
    
    
//    反向遍历也同样方便，调用另外一个方法即可：
    
//    NSArray *iosArray1 = @[@"L", @"O", @"V", @"E", @"I", @"O", @"S"];
    
    [iosArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"%@", obj);
        
        if ([obj isEqualToString:@"E"]) {
            
            *stop = YES;
            
        }
        
    }];
    
    
//    这个方法相对于正向遍历多了一个枚举类型的参数NSEnumerationReverse，打开这个选项就可以反向遍历了。
//
    
    
//    并发遍历：
//    
//    顺着这个枚举类型的参数，就会引出块枚举的另一大优势：并发遍历，参数是：NSEnumerationConcurrent，也就是可以同时遍历collection中的几个元素，具体数量根据系统资源而定。这样会充分利用系统资源，高效快捷的完成collection的遍历，系统底层会通过GCD来处理并发事宜，开发者不需要担心内存和线程，其他方式若要实现高效的并发遍历十分有难度。通过块枚举遍历，改变collection并不会引起崩溃，代码如下：
    
//    NSArray *iosArray = @[@"L", @"O", @"V", @"E", @"I", @"O", @"S"];
    
    NSMutableArray *iosMutableArray = [NSMutableArray arrayWithArray:iosArray];
    
    [iosMutableArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj = [NSString stringWithFormat:@"_%@", obj];
        
        [iosMutableArray replaceObjectAtIndex:idx withObject:obj];
        
        NSLog(@"%@", obj);
        
        if ([obj isEqualToString:@"_I"]) {
            
            *stop = YES;
            
        }
        
    }];
    
    
    
    
    
    
    
//    优缺点总结：
//    
//    优点：
//    
//    1、可以完美实现for循环的所有功能；
//        
//        2、可以方便获取集合中的每一项元素；
//        
//        3、提供了循环遍历的参数，NSEnumerationReverse用来实现倒序循环。NSEnumerationConcurrent用来实现并发遍历，两个参数可以同时使用；
//        
//        4、这种循环方式效率高，能够提升程序性能，开发者可以专注于业务逻辑，而不必担心内存和线程的问题；
//        
//        5、当开启NSEnumerationConcurrent选项时，可以实现for循环和快速遍历无法轻易实现的并发循环功能，系统底层会通过GCD处理并发事宜，这样可以充分利用系统和硬件资源，达到最优的遍历效果；
//            
//            6、可以修改块签名，当我们已经明确集合中的元素类型时，可以把默认的签名id类型修改成已知类型，比如常见的NSString，这样既可以节省系统资源开销，也可以防止误向对象发送不存在的方法是引起的崩溃。
//            
//            缺点：
//            
//            1、很多开发者不知道这种遍历方式；
//            
//            2、这里使用了block，需要注意在block里容易引起的保留环问题，比如使用self调用方法时，把self转化成若引用即可打破保留环。如：__weak __typeof(self)weakSelf = self 或者 __weak MyController *weakSelf = self; 在block里使用weakSelf即可。
//    
//    注意：
//
//    使用基于块的遍历时是可以修改遍历的元素的，不会导致崩溃，但是如果要删除遍历的元素会导致后面的元素无法遍历而崩溃，解决办法有2种，1、一种是复制一份原集合的副本，对副本进行操作，找出所要操作的元素后再处理原集合；2、使用反向遍历，反向遍历删除元素后不会导致崩溃。
    
    
    
//    最后注意一点，在block中不要用return来结束方法
    
}

@end
