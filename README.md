# DSToast
## DSToast

* `DSToast` 是一个简单提示框， 支持，`MacOS`， `iPhone`，`iPad`.

----

## 安装 ( Installation ) 

#### Swift Package Manager


The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler


##### GitHub

```swift
dependencies: [
    .package(url: "https://github.com/swp-song/DSToast.git", .upToNextMajor(from: "1.1.0"))
]
```

##### Gitee ( 国内 )

```swift
dependencies: [
    .package(url: "https://gitee.com/dream-swp/DSToast.git", .upToNextMajor(from: "1.1.0"))
]
````

----

## 使用 ( Use )

```swift
import DSToast

@ObservedObject var `default` = DSToast.Data(title: "`Default`",  message: "`Default Message`")
@ObservedObject var bottom = DSToast.Data(model: DSToast.Molde(title: "`Center`", message: "`Center Message`", textAlignment: .center, alignment: .vertical), position: .bottom)

var body: some View {
        HStack (spacing: 30) {
            Button("`default`") {
                withAnimation {
                    self.default.config.isHidden = false
                }
            }
          	Button("`bottom`") {
                withAnimation {
                    self.bottom.config.isHidden = false
                }
            }
        }
        .padding()
        .dsToast(self.default)
        .dsToast(self.bottom.config.isHidden) {
            DSToast(data: bottom)
        }
        #if os(macOS)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        #endif
      
    }
}


```

----

