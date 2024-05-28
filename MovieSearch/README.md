# Simple Movie App

<img src="https://github.com/CHOIJUNHYUK01/hackingWithSwift/assets/114978803/3496d0f9-95ee-458b-9192-90f5db4b79fb" width="400" />

기본 영화 리스트와 영화 검색 기능이 있는 앱입니다.

## 사용 기술

SwiftUI

## 배운 것

1. 무한 스크롤

   무한 스크롤을 하기 위해서, List를 사용해 맨 아래에 있는 요소에 접근이 됐다면 더 불러올 수 있도록 따로 로직을 생성함

2. 검색 기능 추가

   .searchable이라는 요소를 활용해 UIKit에서 사용했던 uiSearchController를 사용하지 않아도 됐음

3. @Published, @StateObject, ObservableObject

   내가 사용하고 싶은 저장 요소가 담긴 Class를 활용하고 싶다면, ObservableObejct를 상속받아야 함을 알게 됨

   그리고 이를 사용해야 하는 View에서 @StateObject를 사용하여 해당 객체를 불러와서 사용하면 됨

   @Published로 선언된 변수는 사용하는 View에서 양방향 바인딩이 되어, 데이터를 사용하고, 값을 수정하기도 가능하게 됨
