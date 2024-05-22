# Guess The Flag

<img src="https://github.com/CHOIJUNHYUK01/hackingWithSwift/assets/114978803/8b98e9e9-9c9a-4e40-8d51-8bfcf54404d5" width="400" />

## 애니메이션 적용 업데이트

https://github.com/CHOIJUNHYUK01/hackingWithSwift/assets/114978803/45932928-1360-4fb6-9a12-7393cc6bb84d

나라 국기 맞추기 게임입니다.

## 사용 기술

SwiftUI

## 배운 것

1. Gradient

   배경 그라디언트가 다양한 걸 알게 됐다. 디자인에 대해 잘 모르지만, 이렇게 하면 조금은 고급스러워 보인다.

   - Gradient : 기본 Linear Gradient
  
    <img width="100" alt="스크린샷 2024-05-13 오후 7 17 10" src="https://github.com/CHOIJUNHYUK01/hackingWithSwift/assets/114978803/0e009eea-2e71-4bf1-a953-6d9d1c15786b">

   - RadialGradient : 동그라미로 그려지는 Gradient
   
     <img width="100" alt="스크린샷 2024-05-13 오후 7 16 36" src="https://github.com/CHOIJUNHYUK01/hackingWithSwift/assets/114978803/0e4bbcb0-ef25-46f8-9886-e5c3b582731f">

   - AngularGradient : 원점을 기준으로 원형으로 그려지는 Gradient
     
     <img width="100" alt="스크린샷 2024-05-13 오후 7 16 05" src="https://github.com/CHOIJUNHYUK01/hackingWithSwift/assets/114978803/0dd2c3d3-e777-49aa-959f-0bafc5f6141f">

2. ZStack

  깊이를 지정해서 서로 콘텐츠를 겹쳐서 만들 수 있게 해준다.
  이 경우에도 위의 콘텐츠가 더 잘 보일 수 있도록 하는 배경 옵션이 있다.

  - ultraThinMaterial
  - thinMaterial
  - regularMaterial
  - thickMaterial
  - ultrathickMaterial

  이렇게 있는데, 위 스크린샷처럼 불투명한 게 thin 옵션이다.
  밑으로 thick이 될수록 투명도가 떨어진다. 다만, 투명한 바탕은 유지된다.

3. Alert

   ```swift
   .alert("Title", isPresented: $PresentProperty) {
            Button("Button Label", action: "#function")
        } message: {
             // Body Content
        }
   ```

   타이틀과 콘텐츠 바디의 문구, 버튼까지 모두 설정할 수 있다.
   해당 Alert가 뜨기 위해 PresentProperty 또한 양방향 바인딩 속성을 적용하면 된다.

4. Animation

   modifier 순서에도 영향을 받는다.
   여러 개의 animation modifier를 추가할 수도 있다.
   withAnimation을 이용해 transition 값이 있는 요소에 애니메이션을 함수에 추가할 수 있다.
