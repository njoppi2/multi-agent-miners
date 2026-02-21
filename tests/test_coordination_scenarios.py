import pathlib
import unittest


ROOT = pathlib.Path(__file__).resolve().parents[1]
COLLECTOR_ASL = ROOT / "projetos/semincoMineradores/src/asl/col.asl"
BUILDER_ASL = ROOT / "projetos/semincoMineradores/src/asl/builder.asl"


class CoordinationScenarioAssertions(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.collector_text = COLLECTOR_ASL.read_text(encoding="utf-8")
        cls.builder_text = BUILDER_ASL.read_text(encoding="utf-8")

    def test_collectors_broadcast_new_group_resource_positions(self) -> None:
        self.assertIn("+!update_group_found(R)", self.collector_text)
        self.assertIn(".broadcast(tell, group_found(R, X, Y, Max)).", self.collector_text)

    def test_collectors_sort_group_candidates_by_priority(self) -> None:
        self.assertIn(".findall([M,R,A,B],group_found(R, A, B, M),Available_list);", self.collector_text)
        self.assertIn(".sort(Available_list,Sorted);", self.collector_text)
        self.assertIn("!mine_and_take_resources(Smallest_X, Smallest_Y);", self.collector_text)

    def test_builder_triggers_next_resource_search(self) -> None:
        self.assertIn("+enough(R): true", self.builder_text)
        self.assertIn(".broadcast(achieve, search_for(R+1)).", self.builder_text)

    def test_builder_announces_building_finished(self) -> None:
        self.assertIn("+building_finished: true", self.builder_text)
        self.assertIn(".broadcast(tell,building_finished).", self.builder_text)


if __name__ == "__main__":
    unittest.main()
