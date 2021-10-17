import 'package:centro_actividades/screen/activities/models/models.dart';

class BasicActivityBrain {
  List<BasicActivityModel> _samples = [
    BasicActivityModel(
      title: 'Acting Game',
      evidenceType: ['link'],
      description:
          'Crea un video de un minuto, donde tu y tus amigos representen el siguiente concepto:',
      instruccion:
          'Grabe un video, suba a Youtube y comparta el link del video, ejemplo: https://youtu.be/ejemplo',
    ),
    BasicActivityModel(
      title: 'Volunteering',
      evidenceType: ['link', 'image'],
      description:
          'Te invito a realizar una acción de voluntariado asociada al siguiente concepto:',
      instruccion:
          'Suba la evidencia de la realización del voluntariado, donde represente el concepto de la actividad',
    ),
    BasicActivityModel(
        title: 'Artistic Dance',
        evidenceType: ['link'],
        description:
            'Te invito a representar a través de la danza, el siguiente concepto:',
        instruccion:
            'Grabe un video, suba a Youtube y comparta el link del video, ejemplo: https://youtu.be/ejemplo.')
  ];
  int getLength() {
    return _samples.length;
  }

  List<String> getPreview(index) {
    return [_samples[index].title, _samples[index].description];
  }
}
