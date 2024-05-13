# WeSplit

<img src="https://github.com/CHOIJUNHYUK01/hackingWithSwift/assets/114978803/1ce1dd09-2cb2-4ff7-88b1-d0593cba0099" width="400" />

해외에서 팁까지 계산해 더치페이를 편하게 할 수 있게 만들어주는 앱입니다.

## 사용 기술

SwiftUI

## 배운 것

1. @State

   SwiftUI의 View는 struct으로 구성되어 있다.
   그래서 속성을 정의하고, 해당 속성값을 변경하는 함수에는 @mutating 키워드를 붙여야 하지만, 여기서는 속성에 @State라는 속성을 붙이면 된다.

2. $(StateName)

   양방향 바인딩을 한다는 표시를 해준다.
   TextField가 focused 됐는지 알기 위해서는 `.focused($(StateName))`을 해주면 된다.
   이또한 양방향 바인딩 변수를 넣어주면 된다.

3. PickerStyle

   다양한 피커 스타일이 있다.

   - menu : 기본 설정이다.
   - inline : 모든 옵션이 나열된다. 여기 다른 옵션은 선택된 값만 보인다.
   - wheel : 타임 피커처럼 돌려서 설정하는 것이다.
   - navigationLink : 다른 페이지로 이동된다. 해당 페이지에서는 inline으로 나온다.
