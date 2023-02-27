//
//  ViewController.swift
//  HunterXHunter
//
//  Created by Felipe Augusto Correia on 27/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageLogo: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    var hunters: [Hunter] = [Hunter(name: "Gon", hunterImage: UIImage(named: "gon") ?? UIImage(), hunterImage2: UIImage(named: "gon2") ?? UIImage(), desc: "Gon Freecss (ゴン゠フリークス, Gon Furīkusu) is a Rookie Hunter and the son of Ging Freecss. Finding his father is Gon's motivation in becoming a Hunter. He has been the main protagonist for most of the series, having said role in the Hunter Exam, Zoldyck Family, Heavens Arena, Greed Island, and Chimera Ant arcs. He was also the deuteragonist of the Yorknew City arc."),
                             Hunter(name: "Killua", hunterImage: UIImage(named: "killua") ?? UIImage(), hunterImage2: UIImage(named: "killua2") ?? UIImage(), desc: "Killua Zoldyck (キルア゠ゾルディック, Kirua Zorudikku) is the third child of Silva and Kikyo Zoldyck and the heir of the Zoldyck Family, until he runs away from home and becomes a Rookie Hunter. He is the best friend of Gon Freecss and is currently traveling with Alluka Zoldyck. He has served as the deuteragonist for the series, having said role in the Heavens Arena, Greed Island, and Chimera Ant arcs. He was the main protagonist of the 13th Hunter Chairman Election arc. He also was the tritagonist of the Hunter Exam arc and the Yorknew City arc."),
                             Hunter(name: "Leorio", hunterImage: UIImage(named: "leorio") ?? UIImage(), hunterImage2: UIImage(named: "leorio2") ?? UIImage(), desc: "Leorio Paradinight (レオリオ゠パラディナイト, Reorio Paradinaito) is a Rookie Hunter and a member of the Zodiacs with the codename Boar (亥い, I). He is currently a medical student, studying to become a doctor."),
                             Hunter(name: "Kurapika", hunterImage: UIImage(named: "kurapika") ?? UIImage(), hunterImage2: UIImage(named: "kurapika2") ?? UIImage(), desc: "Kurapika (クラピカ, Kurapika) is the last survivor of the Kurta Clan. He is a Blacklist Hunter and current leader of the organization founded by Light Nostrade. He is a member of the Zodiacs with the codename Rat (子ね, Ne). His goal is to avenge his clan and recover the remaining Scarlet Eyes. He takes the role of the main protagonist in the Yorknew City and Succession Contest arcs. He was also the deuteragonist of the Hunter Exam arc."),
                             Hunter(name: "Hisoka", hunterImage: UIImage(named: "hisoka") ?? UIImage(), hunterImage2: UIImage(named: "hisoka2") ?? UIImage(), desc: "Hisoka Morow (ヒソカ゠モロウ, Hisoka Morou) is a Hunter and former member #4 of the Phantom Troupe; his physical strength ranked third in the group. He is always in search for strong opponents, and would spare those who have great potential, such as Gon and Killua in order for them to get strong enough to actually challenge him. He originally served as the primary antagonist of the Hunter Exam arc and the Heavens Arena arc, before becoming a supporting character during the Yorknew City arc and Greed Island arc."),
                             Hunter(name: "Netero", hunterImage: UIImage(named: "netero") ?? UIImage(), hunterImage2: UIImage(named: "netero2") ?? UIImage(), desc: "Isaac Netero (アイザック゠ネテロ, Aizakku Netero) was the 12th Chairman of the Hunter Association[5] and the Head of the Exam Commission.[6] In his youth, he was extolled as the most powerful Nen user in the world, and retained dreadful strength even in his old age.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configtableView()
        
        imageLogo.image = UIImage(named: "hunterLogoImage")
    }
    
    func configtableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hunters.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.setupCell(hunter: hunters[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hunterInfoScreen = UIStoryboard(name: "CharacterInfo", bundle: nil).instantiateViewController(withIdentifier: "CharacterInfo") as? CharacterInfo
        
        hunterInfoScreen?.setupCharacterInfo(hunter: hunters[indexPath.row])
        
        self.navigationController?.pushViewController(hunterInfoScreen ?? UIViewController(), animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

