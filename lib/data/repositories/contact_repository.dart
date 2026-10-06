import '../../domain/models/contact.dart';
import '../../domain/models/user.dart';

class ContactRepository {
  const ContactRepository();

  UserModel getDefaultUser() {
    return const UserModel(
      id: '99999999',
      name: 'Marian Rivera',
      email: 'marian.rivera@cinema.ph',
      phone: '+63 917 555 8291',
      role: 'Primetime Queen & Producer',
    );
  }

  List<Contact> getContacts() {
    return const [
      Contact(
        id: 'artist-01',
        name: 'Marian Rivera',
        role: 'Primetime Queen of Philippine Television & Box Office Star',
        biography:
            'Marian Rivera Gracia-Dantes is widely recognized as the Primetime Queen of Philippine Television. She achieved phenomenal nationwide breakthrough starring as "Marimar" (2007) and followed it with monumental titular roles in "Dyesebel", "Darna", and "Amaya". In 2023, she co-starred in "Rewind", which became the highest-grossing Filipino film of all time in Philippine cinema history.',
        email: 'marian.rivera@cinema.ph',
        phone: '+63 917 555 8291',
        initials: 'MR',
        category: 'Television & Cinema',
        era: '2005 – Present',
        contributions: [
          'Titular lead in monumental television hits Marimar, Dyesebel, and Darna',
          'Co-starred in Rewind, the highest-grossing Philippine film of all time',
          'Multiple Box Office Queen and PMPC Star Awards recipient',
        ],
      ),
      Contact(
        id: 'artist-02',
        name: 'Aga Muhlach',
        role: 'Original Matinee Idol & Multi-Awarded Dramatic Actor',
        biography:
            'Ariel Aquino Muhlach, popularly known as Aga Muhlach, is one of Philippine cinema\'s most acclaimed leading men and matinee idols. Beginning as a child actor in the 1970s and rising to stardom in the iconic 1984 teen film "Bagets", Muhlach evolved into an esteemed dramatic actor with multiple Gawad Urian and FAMAS best actor accolades for masterpieces such as "Sana Maulit Muli", "Basta\'t Kasama Kita", and "Miracle in Cell No. 7".',
        email: 'aga.muhlach@cinema.ph',
        phone: '+63 917 888 1984',
        initials: 'AM',
        category: 'Cinema & Drama',
        era: '1980s – Present',
        contributions: [
          'Lead star of the seminal Filipino youth film Bagets (1984)',
          'Multi-awarded Best Actor by Gawad Urian and FAMAS',
          'Acclaimed lead in modern classics Sana Maulit Muli and Miracle in Cell No. 7',
        ],
      ),
      Contact(
        id: 'artist-03',
        name: 'Vilma Santos',
        role: 'The Star for All Seasons & Grand Slam Best Actress',
        biography:
            'Rosa Vilma Tuazon Santos-Recto, hailed as "The Star for All Seasons", is one of the most prolific, accomplished, and decorated actresses in Philippine history. Beginning as a child star in "Trudis Liit" (1963), she delivered towering performances in cinema classics like "Relasyon", "Burlesk Queen", "Bata, Bata... Pa\'no Ka Ginawa?", and "Dekada \'70", achieving multiple Grand Slam Best Actress honors.',
        email: 'vilma.santos@cinema.ph',
        phone: '+63 917 333 1963',
        initials: 'VS',
        category: 'Golden Age & Drama',
        era: '1960s – Present',
        contributions: [
          'Achieved multiple unprecedented Grand Slam Best Actress distinctions',
          'Star of timeless cinematic classics Relasyon, Burlesk Queen, and Dekada \'70',
          'Distinguished public servant and enduring Philippine cultural icon',
        ],
      ),
      Contact(
        id: 'artist-04',
        name: 'Nora Aunor',
        role: 'The Superstar & National Artist for Film and Broadcast Arts',
        biography:
            'Nora Cabaltera Villamayor, revered nationwide as "The Superstar", is a National Artist for Film and Broadcast Arts. Renowned for her deeply emotive eyes and groundbreaking naturalistic acting style, she starred in Ishmael Bernal\'s cinematic masterpiece "Himala" (1982), consistently ranked as the greatest Filipino film of all time, as well as "Bona", "Tatlong Taong Walang Diyos", and "Thy Womb".',
        email: 'nora.aunor@cinema.ph',
        phone: '+63 917 222 1982',
        initials: 'NA',
        category: 'National Heritage',
        era: '1967 – Present',
        contributions: [
          'Conferred the prestigious Order of National Artists of the Philippines',
          'Starred as Elsa in Ishmael Bernal\'s masterwork Himala (1982)',
          'Winner of international honors at Cairo, Cannes, and the Asian Film Awards',
        ],
      ),
      Contact(
        id: 'artist-05',
        name: 'Gloria Romero',
        role: 'Queen of Philippine Cinema & Sampaguita Pictures Icon',
        biography:
            'Gloria Galla, professionally known as Gloria Romero, was hailed as the Queen of Philippine Cinema during the legendary Golden Age of Sampaguita Pictures. Known for her regal grace and versatile artistry, her seven-decade career encompassed unforgettable classics such as "Dalagang Ilocana" (1954), "Cofradia", and "Tanging Yaman" (2000).',
        email: 'gloria.romero@cinema.ph',
        phone: '+63 917 111 1954',
        initials: 'GR',
        category: 'Golden Age',
        era: '1950s – 2020s',
        contributions: [
          'Paramount leading lady of the Golden Age of Philippine Cinema',
          'FAMAS Best Actress for Dalagang Ilocana (1954) and Tanging Yaman (2000)',
          'Recipient of Gawad CCP Para sa Sining and Lifetime Achievement honors',
        ],
      ),
      Contact(
        id: 'artist-06',
        name: 'Sharon Cuneta',
        role: 'The Megastar of Philippine Cinema & Multi-Media Icon',
        biography:
            'Sharon Gamboa Cuneta-Pangilinan, known universally as "The Megastar", revolutionized Philippine popular entertainment across music, film, and television. From her teen idol start in "Dear Heart" (1981) to powerhouse dramatic triumphs in "Bituing Walang Ningning", "Madrasta", and "Caregiver", she earned record-setting box-office receipts and Grand Slam Best Actress awards.',
        email: 'sharon.cuneta@cinema.ph',
        phone: '+63 917 444 1981',
        initials: 'SC',
        category: 'Cinema & Music',
        era: '1978 – Present',
        contributions: [
          'Crowned Box Office Queen of Philippine Cinema numerous consecutive years',
          'Grand Slam Best Actress for Madrasta (1996)',
          'Cultural icon behind evergreen hits Bituing Walang Ningning and Mr. DJ',
        ],
      ),
      Contact(
        id: 'artist-07',
        name: 'Maricel Soriano',
        role: 'The Diamond Star of Philippine Television & Film',
        biography:
            'Maria Cecilia Dador Soriano, celebrated as "The Diamond Star", is legendary for her sharp dramatic intensity, unmatched taray delivery, and consummate comedic timing. Starting as a child star in "John en Marsha", she dominated television and the silver screen with memorable performances in "Kaya Kong Abutin ang Langit", "Separada", and "Inagaw Mo ang Lahat sa Akin".',
        email: 'maricel.soriano@cinema.ph',
        phone: '+63 917 777 1974',
        initials: 'MS',
        category: 'Drama & Comedy',
        era: '1970s – Present',
        contributions: [
          'Hailed as The Diamond Star for sustained excellence across drama and comedy',
          'Star of critically acclaimed box office classics Separada and Mila',
          'Multiple Best Actress trophies from Gawad Urian, FAMAS, and FAP',
        ],
      ),
      Contact(
        id: 'artist-08',
        name: 'Judy Ann Santos',
        role: 'Queen of Philippine Soap Operas & Dramatic Luminary',
        biography:
            'Judy Anne Lumagui Santos-Agoncillo, dubbed the "Queen of Philippine Soap Opera", captured the nation as the titular child heroine in "Mara Clara" (1992–1997) and "Esperanza". She transitioned seamlessly into adult prestige cinema, earning international and local acclaim for dramatic turns in "Kasal, Kasali, Kasalo", "Ploning", and "Mindanao" (winning Best Actress at Cairo International Film Festival).',
        email: 'judyann.santos@cinema.ph',
        phone: '+63 917 666 1992',
        initials: 'JS',
        category: 'Television & Drama',
        era: '1986 – Present',
        contributions: [
          'Reigned over 1990s television through the cultural milestone Mara Clara',
          'Best Actress at the 41st Cairo International Film Festival for Mindanao',
          'Grand Slam Best Actress and critically acclaimed culinary entrepreneur',
        ],
      ),
    ];
  }

  /// Locates an artist by identifier, returning null if absent.
  Contact? getContactById(String id) {
    try {
      return getContacts().firstWhere((element) => element.id == id);
    } catch (_) {
      return null;
    }
  }
}
