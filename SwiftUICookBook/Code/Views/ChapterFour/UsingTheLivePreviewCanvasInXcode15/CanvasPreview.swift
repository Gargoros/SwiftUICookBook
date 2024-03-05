//
//  CanvasPreview.swift
//  SwiftUICookBook
//
//  Created by MIKHAIL ZHACHKO on 3.03.24.
//

import SwiftUI

struct CanvasPreview: View {
    //MARK: - Variables
    @Environment(\.colorScheme) var deviceColorScheme
    
    //MARK: - Views
    var body: some View {
        if deviceColorScheme == .light {
            PostView(
                title: "Captivating force of light",
                text: "The captivating force of light lies in it's ability to ignite our senses and draw us into a mesmerizing world of beauty and wonder. It dances across the landscape, casting intricate patterns and creating a symphony of colors. Whether it cascades through a stained-glass window, dapples through a canopy of trees, or reflects off a shimmering body of water, light possesses an inherent allure that captivates our attention. It has the power to transform ordinary scenes into extraordinary ones, unveiling the hidden details and textures that might otherwise go unnoticed. Light creates a dynamic interplay between shadows and highlights, enhancing the depth and dimension of our surroundings, and evoking an emotional response that resonates within us.",
                imageName: "sun.max.fill")
            .navigationTitle("Light colors")
        }
        else {
            PostView(
                title: "Fascinating Dark Secrets",
                text: "The concept of fascinating darkness captivates the imagination, drawing us into a realm of mystery and intrigue. Within the folds of darkness, hidden wonders and secrets lie waiting to be discovered. It is in this absence of light that our senses heighten, and our perception expands beyond the ordinary. Fascinating darkness challenges our understanding of the world, inviting us to explore the depths of our own thoughts and emotions. It is a canvas upon which our imagination can paint vivid scenes and narratives, sparking creativity and contemplation. In the captivating embrace of darkness, we find solace, inspiration, and the opportunity for self-discovery.",
                imageName: "moon.stars.fill")
            .navigationTitle("Dark colors")
        }
    }
}

#Preview {
    CanvasPreview()
}
