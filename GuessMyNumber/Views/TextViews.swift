//
//  TextViews.swift
//  GuessMyNumber
//
//  Created by bogdanov on 08.06.21.
//

import SwiftUI

struct InstructionText: View {
    var text: String

    var body: some View {
        Text(text)
            .kerning(2.0)
            .bold()
            .multilineTextAlignment(.center)
            .font(.footnote)
    }
}

struct BigText: View {
    var text: String

    var body: some View {
        Text(String(text))
            .font(.largeTitle)
            .fontWeight(.black)
            .kerning(-1.0)
    }
}

struct SliderLabel: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .frame(width: 35)
    }
}

struct LabelText: View {
    var text: String

    var body: some View {
        Text(text)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
            .font(.caption)
            .bold()
            .textCase(.uppercase)
    }
}

struct RoundedRectTextView: View {
    var text: String

    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title)
            .frame(minWidth: Constants.General.roundedRectViewWidth, minHeight: 55)
            .foregroundColor(Color("TextColor"))
            .background(
                RoundedRectangle(cornerRadius: 21)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct BodyText: View {
    var text: String

    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(11.0)
    }
}

struct ButtonText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .font(.body)
            .cornerRadius(12.0)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "title")
            BigText(text: "999")
            SliderLabel(text: "11")
            LabelText(text: "text")
            RoundedRectTextView(text: "999")
            BodyText(text: "You scored 200 points! \n 🥁🏆🎯")
            ButtonText(text: "Start new round")
        }.previewLayout(.fixed(width: 200, height: 300))

        VStack {
            InstructionText(text: "title")
            BigText(text: "999")
            SliderLabel(text: "11")
            LabelText(text: "text")
            RoundedRectTextView(text: "999")
            BodyText(text: "You scored 200 points! \n 🥁🏆🎯")
            ButtonText(text: "Start new round")
        }.previewLayout(.fixed(width: 200, height: 300))
            .preferredColorScheme(.dark)
    }
}
