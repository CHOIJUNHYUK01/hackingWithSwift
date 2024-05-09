# hackingWithSwift

## 프로젝트

### WeSplit

1. @State
   <br />
   함수에 @mutating을 해주는 것과 하는 행동이 비슷하다고 할 수 있다.
   <br/>
   struct로 된 View에서 사용할 바뀌는 속성을 이 어트리뷰트로 표기해준다.

2. $(State)
   <br />
   TextField에서 입력된 값을 바로 업데이트해주는 역할을 해준다.
   <br />
   양방향 바인딩을 해준다고 보면 된다.

3. @Focusstate
   <br />
   TextField가 포커싱되어 있어서 키보드가 올라와 있냐 아니냐를 판단해줄 수 있다.
   <br />
   TextField에서 .focused에 추가해주면 된다.
   <br />
   이또한 값을 업데이트해줘야 하기에 $(State)를 사용해야 한다.

4. PickerStyle
   <br />
   피커 스타일을 지정해 줄 수 있다.
   <br />

- menu : 기본 설정이다
- inline : 모든 옵션이 TableView 같이 나열된다
- wheel : 타임 피커마냥 돌릴 수 있게 한다
- navigationLink : 다른 페이지로 이동해 inline 형식으로 된다
