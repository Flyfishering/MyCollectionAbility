layoutSubviews 方法触发，及执行顺序

------------------
触发 layoutSubviews
1. 直接调用[self setNeedsLayout]
2. addSubview
3. view 的 size 发生改变 (origin.x, origin.y 改变不会触发，只有宽高改变了才会触发) 
4. 滑动 UIScrollView
5. 旋转 屏幕会触发父 view 上的 layoutSubviews

PS: 触发父视图 的 layoutSubviews 方法，则所有子视图的 layoutSubviews 方法都会被触发,同时父视图的父视图 layoutSubviews 也会调用(只会调用一层父视图)

------------------

下面的例子 测试当 view 有多层子 view 时，layoutSubviews 的执行顺序



1. 页面布局：
self.view    
|---->containView
|---->subview1
|---->subview2
|---->subview3

layoutSubviews 执行顺序
|----> DemoSubview3
|----> DemoSubview2
|----> DemoSubview1
|----> containView

2. 页面布局：
self.view    
|---->containView
|---->subview1
|---->subview2
|---->subview3

layoutSubviews 执行顺序
|----> containView
|----> containView
|----> DemoSubview3
|----> DemoSubview2
|----> DemoSubview1

3. 页面布局：
self.view    
|---->containView
|---->subview1
|---->subview2
|---->subview3

layoutSubviews 执行顺序
|----> containView
|----> DemoSubview1
|----> containView
|----> DemoSubview1
|----> DemoSubview3
|----> DemoSubview2

4. 页面布局：
self.view    
|---->containView
|---->subview1
|---->subview2
|---->subview3

layoutSubviews 执行顺序
|----> containView
|----> DemoSubview1
|----> DemoSubview2
|----> containView
|----> DemoSubview1
|----> DemoSubview2
|----> DemoSubview3

通过上面 4 个例子可以得到结论
1. 如果 按照顺序把 view1,view2,view3,view4 添加到容器视图 containView中
layoutSubviews 执行顺序是 逆序执行 view4,view3,view2,view1,containview
2. 如果先把 view1 添加到容器视图 containview中，再按顺序把 view2,view3,view4 添加到 view1 中
layoutSubviews 分两步执行
以最底层视图的父视图为界限，
- 先按顺序执行 最底层父视图 的 所有父视图跟最底层父视图的layoutSubviews方法
- 然后 再重复执行上一步操作 加上 最底层视图的逆序执行

分析第三个例子，最底层父视图是 DemoSubview1
- 先按顺序执行到 最底层父视图 顺序为 containView->DemoSubview1
- 再重复上面的操作 containView->DemoSubview1
- 最后逆序执行最底层视图 DemoSubview3->DemoSubview2
合在一起就是 containView->DemoSubview1->containView->DemoSubview1->DemoSubview3->DemoSubview2



