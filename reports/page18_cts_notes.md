1. Because it leads to fanout, delay, and skew.
2. Time from the source to when the clock edge reaches a sink.
3. When two flip-flops receive an edge at different times, that difference is skew.
4. Setup is making sure the data is stable before reaching the capture edge. Hold is making sure the data is stable after the capture edge.
5. CTS increases area because it introduces new cells for the buffers. Having new buffers also increases power. 
