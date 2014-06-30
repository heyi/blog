#移动开发个人总结
##过去的经验陷井与思维定势

在开发官网的时候，引入iscroll5, 由此引发了一些问题。
* 光标跳动/文本框消失
* 滑动隐藏虚拟键盘
* 引发的性能问题
google之，发现这些问题很普遍。解决方案也很多，总之是个相应麻烦与
头疼的问题。

后来想，当时我为什么要用iscroll呢，仅仅是因为过去使用过，觉得很好
用，体验也不错。用在这里合适吗？


直觉用原生滚动会更好，[ overflow:scrolling 兼容性检测报告](http://www.quirksmode.org/css/css2/mobile.html)
**ios 有个小技巧**
```css
	overflow-y: scroll; /* has to be scroll, not auto */
	overflow-x: hidden;
	-webkit-overflow-scrolling: touch; // for safari scroll bug.
```
![alt text][https://raw.githubusercontent.com/heyi/blog/master/imgs/mobile_overflow.png,"overflow scrolling detected"]
如图，不支持overflow scrolling ,overflow auto 的手机或者浏览器主要集中android 3 以下的版本。 现在android 基本是4以上，2年前的旧手机普遍是3左右;
值得注意的是uc ,在国内市场占有率是比较高的。这也是一个坑，所以在决定方案的时候，可以考虑进去。 
得出的结论是，绝大多数情况下，用原生的滚动会更合适。

##用sass组织css非常方便
```
.concat-us {
	.logo {
		background-image: url(../images/concat-us.png);
		height: 180px;
	}
	.info {
		padding: 12px;
		h3 { margin-bottom: 12px; }
		i.iconfont {
			font-size: 1.2rem;
			color : #4fbcbe;
		}
		a.email-text {
			color : #4fbcbe;
		}
	}
}
```
项目中的代码片断，这种组织的好处就是方便管理，写起来很爽。
在设计风格多变的页面中有很大管理维护优势，缺点是提取共用性的css比较困难.

