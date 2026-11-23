import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_refleks_testi/oyun_refleks_testi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(refleksConfig.title.length, 33);
    expect(refleksConfig.tagline.length, 33);
    for (final s in refleksConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(refleksRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: refleksId, optionalMechanics: refleksRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(refleksRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
