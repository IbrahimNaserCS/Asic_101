| Metric | Ripple | CLA | Carry Select |
|---|---:|---:|---:|
| Functional verification | Pass | Pass | Pass |
| Clock constraint | 10 ns | 10 ns | 10 ns |
| Cell count | 437 | 437 | 449 |
| Standard-cell area | 2693.83 | 2693.83 | 2813.95 |
| Worst setup slack | 1.173 | 1.173 | 2.523 |
| Worst hold slack | 0.136 | 0.136 | 0.135 |
| Estimated power | 0.438 | 0.438 | 0.446 |
| Routed wirelength | 4919 | 4919 | 5136 |
| Buffer count* | 46 | 46 | 45 |
| DRC status | Pass | Pass | Pass |
| LVS status | Pass | Pass | Pass |
| Final flow status | Pass | Pass | Pass |

Ripple Carry and CLA produced identical synthesized netlists and physical timing results. Their critical path begins at op_q[1] and ends at register _291_, passing through 11 combinational gates.

Carry Select's critical path begins at op_q[0] and ends at register _317_, passing through 8 combinational gates.

Carry Select achieved 2.523 ns of worst setup slack compared with 1.173 ns for Ripple and CLA, an improvement of 1.351 ns. This improvement was accompanied by a 4.46% increase in standard-cell area and approximately 1.75% increase in estimated power.

These results suggest that Carry Select produced a more favorable timing implementation under the tested constraints. However, further netlist analysis would be required to establish which portions of the improvement are directly attributable to the adder architecture.
