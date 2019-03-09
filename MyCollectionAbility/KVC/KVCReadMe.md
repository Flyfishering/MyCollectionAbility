#  基于 get 的搜索模式

1. 搜索实例方法：get<Key>, <key>, is<Key>, or _<key>,  如果找到了 调用这些方法，就进入第 5 步， 没找到就进入下一步
2. 搜索下面的名字的实例和方法：
    - `countOf<Key> `and `objectIn<Key>AtIndex: ` (属于 NSArray 定义的方法) 
    - `<key>AtIndexes:`(NSArray 方法 ：`objectsAtIndexes`)
    如果找到了- `countOf<Key> `方法，  `objectIn<Key>AtIndex: ` 和   - `<key>AtIndexes:` 中的一个，就生成返回一个 集合的 代理对象
    没找到，就如下一步
    > 代理对象将接收到的 `NSArray` 消息转换为 `countOf<Key>, objectIn<Key>AtIndex: ,<key>AtIndexes:,get<Key>:range:` 我们可以把代理对象当做 NSArray 使用
    
3. 第三次开始查找方法 ` countOf<Key>, enumeratorOf<Key>, and memberOf<Key>:` 属于 NSSet 定义的方法 , 
        - 如果找到，就当做 NSSet 的方法返回
        - 如果没有找到，进入第四步
4.  上面几步都没有找到，则 查找对象有没有实现方法 `accessInstanceVariablesDirectly` 默认返回 YES, 可以查找对象的实例变量 如：
     `_<key>, _is<Key>, <key>, or is<Key>,`

5. 如果属性是 指针对象，直接返回该对象
    如果是 支持 NSNumber 类型的标量，转化为 NSNumber 返回
    如果是不支持 NSNumber 类型的标量，转化为 NSValue 返回
6. 如果上面过程都没有找到，则调用方法 `valueForUndefinedKey:.` ,跑出异常， 该方法可以被子类重写 


# 基于 SET 的写入模式
1.  查找方法名为 `set<Key>: or _set<Key>`，赋值
2.  `accessInstanceVariablesDirectly` 返回 YES 的情况下（默认返回 YES）查找 实例变量名为 ` _<key>, _is<Key>, <key>, or is<Key>,` 赋值
3. 如果都没找到， `setValue:forUndefinedKey:. ` 抛出异常， 并且 子类可以重写该方法;

# 基于集合类型的搜索
1. 查找下面的方法 
    * `insertObject:in<Key>AtIndex: and removeObjectFrom<Key>AtIndex:`
    类似于 NSMutableArray 的方法 `insertObject:atIndex: and removeObjectAtIndex:`
    
    * `insert<Key>:atIndexes: and remove<Key>AtIndexes:` 
    类似于 NSMutableArray 的方法
     `NSMutableArrayinsertObjects:atIndexes: and removeObjectsAtIndexes:`
     
    * 当实现了方法 `mutableArrayValueForKey:`
        同时实现了 下面两个方法中的某一个，这样性能会更好
        `replaceObjectIn<Key>AtIndex:withObject: or replace<Key>AtIndexes:with<Key>`
2. 如果没有找到可变的集合方法，则搜索一个名为 `set:` 的访问器方法。在这种情况下,返回的代理对象发送一组`set<key>`:信息的原始接收机`mutableOrderedSetValueForKey:`每次收到`NSMutableOrderedSet`消息。
    * 该步骤 效率太低，建议自行处理
    （这步没看懂）

3. 如果既没有可变数组方法，也没有找到访问器，如果接受者的方法 `accessInstanceVariablesDirectly` 返回 YES ， 搜索下面的实例变量 `_<key> or <key>`
    如果找到了这样一个 实例变量，返回一个代理对象，这个对象把接收到的每个 `NSMutableArray` 消息 发送给实例变量， 这个对象通常是一个 `NSMutableArray` 的实例变量或者子类 

4. 如果都没找到，当接受一个 `NSMutableArray`消息时，返回一个可变集合代理对象 抛出问题 `setValue:forUndefinedKey: ` 方法，发送给原始接收器 `mutableArrayValueForKey:`
        

# Search Pattern for Mutable Ordered Sets
-  同上

# Search Pattern for Mutable Sets
- 同上
    
