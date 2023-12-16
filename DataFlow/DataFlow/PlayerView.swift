//
//  PlayerView.swift
//  DataFlow
//
//  Created by 김우섭 on 12/16/23.
//

import SwiftUI

struct PlayerView: View {
    let episode: Episode
    @State private var isPlaying: Bool = false
    /*
    재생여부 데이터는 SwiftUI에게 재생여부관련한 상태를 저장하는 Single Source of Truth야
    이 상태는 SwiftUI에서 이 정보가 바뀌면, 다시 다 렌더링해야한다고 표시해주는 것이다.
    Button과 image가 재생여부에 따라서 영향을 받는다.
    버튼을 눌렸을 때 isPlaying의 상태를 변경해준다.
    @state가 바뀌면 body에 있는 내용이 자동으로 렌더링된다.
    */
    var body: some View {
        VStack(spacing: 20) {
            Text(episode.title)
                .font(.largeTitle)
            Text(episode.showTitle)
                .font(.title3)
                .foregroundColor(.gray)
            
            PlayButton(isPlaying: $isPlaying)
            
            PlayingStatusView(isPlaying: $isPlaying)
            
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(episode: Episode.list[0])
    }
}



