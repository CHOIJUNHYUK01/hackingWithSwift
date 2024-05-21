# WordScramble

<img src="https://github.com/CHOIJUNHYUK01/hackingWithSwift/assets/114978803/ae9aea30-00da-40f0-82ff-2e33033e9af5" width="300" />

단어를 쥐어주고, 해당 단어에 있는 알파벳만 이용해서 단어를 만들어내는 게임을 하는 앱입니다.

## 사용 기술

SwiftUI

## 배운 것

1. List

   UIKit에 있는 UITableView와 동일하다.

2. UITextChecker

   이게 실제 있는 단어와 비교해서, 실제 있는 단어인지, 스펠링은 맞는지 확인해주는 빌트인 함수다.

3. Bundle

   앱은 하나의 번들로 묶인다. 그걸 이용해서 앱에 포함된 이미지와 같은 에셋을 모두 부를 수 있다.
   <br />
   아래 함수로 파일 이름과 확장자 이름만 주어지면 파일이 있으면 불러와준다.

   ```swift
   Bundle.main.url(forResource: "filename", withExtension: "txt")
   ```

   이 아래 함수는 위 함수로 불러온 파일에 있는 내용을 string으로 만들어주는 함수다.
   <br />
   txt 파일이기에 이렇게 불러올 수 있다.
   ```swift
   try? String(contentsOf: fileURL)
   ```
