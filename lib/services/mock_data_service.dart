import '../models/celula.dart';
import '../models/igreja.dart';
import '../models/daily_word.dart';
import '../models/content.dart';
import '../models/community_post.dart';

class MockDataService {
  static final List<DailyWord> dailyWords = [
    DailyWord(
      versiculo: "Vinde a mim, todos os que estais cansados e oprimidos, e eu vos aliviarei.",
      explicacao: "Jesus nos convida a entregar nossas ansiedades a Ele.",
      categoria: "Ansiedade",
    ),
    DailyWord(
      versiculo: "O Senhor é o meu pastor, nada me faltará.",
      explicacao: "Deus cuida de cada detalhe da nossa vida com amor.",
      categoria: "Fé",
    ),
    DailyWord(
      versiculo: "Honra a teu pai e a tua mãe.",
      explicacao: "A base da família cristã é o respeito e o amor mútuo.",
      categoria: "Família",
    ),
  ];

  static final List<Celula> celulas = [
    Celula(
      id: "1",
      nome: "Célula Shalom",
      igreja: "Igreja Paz das Nações",
      diaSemana: "Terça-feira",
      horario: "19:30",
      distancia: 1.2,
    ),
    Celula(
      id: "2",
      nome: "Célula Esperança",
      igreja: "Igreja Paz das Nações",
      diaSemana: "Quinta-feira",
      horario: "20:00",
      distancia: 2.5,
    ),
    Celula(
      id: "3",
      nome: "Célula Online Conexão",
      igreja: "Igreja Viva",
      diaSemana: "Segunda-feira",
      horario: "21:00",
      distancia: 0,
      isOnline: true,
      linkReuniao: "https://zoom.us/j/mock_meeting",
    ),
  ];

  static final List<Igreja> igrejas = [
    Igreja(
      id: "1",
      nome: "Igreja Paz das Nações",
      cidade: "São Paulo",
      descricao: "Uma igreja focante em missões e no poder de Deus.",
      avisos: ["Culto de Jovens às 19h no Sábado", "Reunião de Líderes no Domingo"],
      palavraPosCulto: "A importância de perseverar na oração.",
      pedidosAjuda: ["Família precisa de cesta básica", "Apoio para reforma do telhado"],
    ),
    Igreja(
      id: "2",
      nome: "Igreja Paz das Nações",
      cidade: "Rio de Janeiro",
      descricao: "Comunidade fervorosa e acolhedora.",
      avisos: ["Santa Ceia no próximo Domingo"],
      palavraPosCulto: "Crescendo na graça e no conhecimento.",
      pedidosAjuda: ["Doação de agasalhos"],
    ),
  ];

  static final List<Content> contents = [
    Content(
      titulo: "A Paixão de Cristo",
      descricao: "O sacrifício supremo por amor à humanidade.",
      imagemUrl: "assets/images/passion.png",
      categoria: "Filmes",
    ),
    Content(
      titulo: "Jesus o Filho do Homem",
      descricao: "A vida e ministério do Redentor na Terra.",
      imagemUrl: "https://images.unsplash.com/photo-1504052434569-70ad5836ab65?q=80&w=200",
      categoria: "Filmes",
    ),
    Content(
      titulo: "O Peregrino",
      descricao: "Uma jornada épica de fé baseada na obra de John Bunyan.",
      imagemUrl: "https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=200",
      categoria: "Filmes",
    ),
    Content(
      titulo: "Rock Gospel Oficina G3",
      descricao: "O melhor do rock cristão nacional no volume máximo.",
      imagemUrl: "assets/images/rock.png",
      categoria: "Música",
    ),
    Content(
      titulo: "Hinos Clássicos",
      descricao: "Coletânea de adoração pura para momentos de oração.",
      imagemUrl: "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?q=80&w=200",
      categoria: "Música",
    ),
    Content(
      titulo: "Peniel",
      descricao: "Face a face com a glória de Deus em silêncio profundo.",
      imagemUrl: "assets/images/peniel.png",
      categoria: "Pregações",
    ),
    Content(
      titulo: "O Sermão do Monte",
      descricao: "Uma análise profunda das bem-aventuranças.",
      imagemUrl: "https://images.unsplash.com/photo-1501139083538-0139583c060f?q=80&w=200",
      categoria: "Pregações",
    ),
  ];

  static final List<CommunityPost> posts = [
    CommunityPost(
      id: "1",
      titulo: "Músico procurando ministério",
      conteudo: "Toco violão e bateria. Gostaria de servir em uma igreja local na região central.",
      autor: "Gabriel Silva",
    ),
    CommunityPost(
      id: "2",
      titulo: "Igreja procura voluntários",
      conteudo: "Estamos precisando de ajuda no ministério infantil aos domingos.",
      autor: "Igreja Paz das Nações",
    ),
    CommunityPost(
      id: "3",
      titulo: "Serviço de Marcenaria",
      conteudo: "Faço reparos em bancos e móveis de igreja com desconto para membros.",
      autor: "José Marceneiro",
    ),
    CommunityPost(
      id: "4",
      titulo: "Gratidão",
      conteudo: "Gostaria de agradecer a Deus por uma porta que se abriu esta semana!",
      isAnonymous: true,
    ),
    CommunityPost(
      id: "5",
      titulo: "Carta ao Coração",
      conteudo: "Não desista, o deserto é apenas uma passagem para a terra prometida.",
      isAnonymous: true,
    ),
  ];
}
