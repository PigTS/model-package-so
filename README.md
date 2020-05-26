# model-package-so
&#160; &#160; &#160; &#160;将模型和代码整合打包成so库，神经网络框架采用ncnn，打包工具为NDK（[https://developer.android.google.cn/ndk/downloads](https://developer.android.google.cn/ndk/downloads)），整体思路可见博客：[https://blog.csdn.net/Enchanted_ZhouH/article/details/106365450](https://blog.csdn.net/Enchanted_ZhouH/article/details/106365450)

&#160; &#160; &#160; &#160;目录层级：

&#160; &#160; &#160; &#160;assets --- 资源文件夹

&#160; &#160; &#160; &#160;java --- 接口文件及调用示例

&#160; &#160; &#160; &#160;jni --- ndk-build编译入口，包含Android.mk和Application.mk

&#160; &#160; &#160; &#160;libs --- 打包后各架构下的so

&#160; &#160; &#160; &#160;ncnn --- 编译后各架构下的ncnn，只包含install目录

&#160; &#160; &#160; &#160;src --- 工程的源文件

&#160; &#160; &#160; &#160;使用方法：将java和libs目录中的接口文件以及库文件导入Android工程中，可以直接进行调用测试。

&#160; &#160; &#160; &#160;使用自己的模型重新打包：NDK安装（解压+环境变量），并将src下的源码修改后，重新打包的命令如下：


```
cd jni
ndk-build
```
&#160; &#160; &#160; &#160;重新生成的so可见libs目录。

&#160; &#160; &#160; &#160;注：src中的mobilenet_v2.id.h和mobilenet_v2.mem.h是mobilenet_v2模型读进内存后的头文件，由于大于50M，上传有些问题（提示错误，但上传成功了，文件却更大了？懵了），我将这两个文件放在了百度云上，链接：https://pan.baidu.com/s/1ry6-NhlUfQeCwSbLuMsEZw ，提取码：2zpp ，下载后替换掉src下的模型头文件即可，省心~


