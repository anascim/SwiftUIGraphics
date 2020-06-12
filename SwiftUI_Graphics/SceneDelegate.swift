//
//  SceneDelegate.swift
//  SwiftUI_Graphics
//
//  Created by Luiza Fattori on 10/06/20.
//  Copyright © 2020 Luiza Fattori. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = WordCloud(text: "Mindset Mindset Mindset Mindset Mindset Mindset Mindset Networking Networking Networking Players Players Players Players Believe Believe Believe Work Work Work Business Stonks Stonks Stonks Stonks Top Antenado MenteAberta Suce$$o Power Power Power Power cr14t1v1d4d3 Otimista Realizador Autodeterminado Autoconfiança Inovação Inovação Inovação Originalidade Diferente Diferencial Diferencial Diferencial Valores Propósito Propósito Propósito Propósito Progresso Progresso Progresso Progresso Metas Metas Metas Potencial Ideia Lucro Dinheiro Superávit Superávit Superávit Superávit Sonhos Sonhos  Falhar Sacrifícios Fluxo Conquista Aventura Oportunidades Persistência Disciplina Inspiração Energia Ação Liderança Liderança Liderança Liderança Resultados Resultados Resultados Crescimento Performance FOCO FOCO FOCO FOCO FOCO Growth Growth Growth Growth Atitudes Atitudes Valores Orgulho Moral Produtividade Produtividade Produtividade Produtividade Produtividade Produtividade Equipe FalheRápido Feedback Obstáculos Garra Garra Perspectivas Desafios Desafios Confiança Confiança Goal Impacto Impacto Impacto")

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

