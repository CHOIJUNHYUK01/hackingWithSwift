# ConversionWrapper

<img src="https://github.com/CHOIJUNHYUK01/hackingWithSwift/assets/114978803/9df8e820-5781-4135-928a-8836a2c41a47" width="400" />

온도, 길이, 부피, 시간을 단위별로 변환해주는 앱입니다.

## 사용 기술

SwiftUI

## 배운 것

1. 유닛 단위 변경 내부 함수가 있다.
   
   ```swift
    let heightFeet = Measurement(value: 6, unit: UnitLength.feet)

    let heightInches = heightFeet.converted(to: UnitLength.inches)
    let heightSensible = heightFeet.converted(to: UnitLength.meters)
   ```
   
    길이 이외에도 UnitTemperature, UnitLength, UnitVolume, UnitArea, UnitMass 등이 더 있다.

2. 직접 borderStyle로 지정하면 모서리가 지워지는 상황이 생겼다.

     이를 해결하기 위해 overlay 옵션을 사용해 둥근 사각형 경계선을 그렸다.

   ```swift
     TextField("", text: $inputValue)
         .overlay(
                RoundedRectangle(cornerRadius: 8) // 둥근 사각형으로 경계선을 그림
                    .stroke(tempColor(), lineWidth: 1) // 검은색 테두리를 적용
          )
   ```

3. 해당 @State를 사용하는 계산 속성을 사용하면, 해당 계산 속성은 매번 불린다.

     당연한 처사다. 계산 속성은 사용할 때마다 계산이 되는 거니 말이다.
     하지만 그렇게 바뀌어야 할 값이 아닌 것도 바뀌는 상황이 생긴다.

     ```swift
     private var detailUnits: [String] {
        switch inputUnit {
        case "Length":
            return lengthUnits
        case "Time":
            return timeUnits
        case "Volume":
            return volumeUnits
        default:
            return tempUnits
        }
    }
     ```

       이렇게 해당 유닛에 따른 세부 단위 옵션을 지정하는 계산 속성은 그때만 바뀌면 되는데 계속 불려서 불편했다.
       지금은 가벼운 앱이니 괜찮겠지만, 더 많은 옵션이 사용되는 상황이 되면 메모리 문제가 생기지 않을까 싶다.
