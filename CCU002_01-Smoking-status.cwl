cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ccu002_01-smoking-status-exsmoker---primary:
    run: ccu002_01-smoking-status-exsmoker---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  ccu002_01-smoking-status-cigar---primary:
    run: ccu002_01-smoking-status-cigar---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-exsmoker---primary/output
  ccu002_01-smoking-status-exlight---primary:
    run: ccu002_01-smoking-status-exlight---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-cigar---primary/output
  ccu002_01-smoking-status-expipe---primary:
    run: ccu002_01-smoking-status-expipe---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-exlight---primary/output
  ccu002_01-smoking-status-rollup---primary:
    run: ccu002_01-smoking-status-rollup---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-expipe---primary/output
  trivial-ccu002_01-smoking-status---primary:
    run: trivial-ccu002_01-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-rollup---primary/output
  ccu002_01-smoking-status-ceased---primary:
    run: ccu002_01-smoking-status-ceased---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: trivial-ccu002_01-smoking-status---primary/output
  ccu002_01-smoking-status-exheavy---primary:
    run: ccu002_01-smoking-status-exheavy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-ceased---primary/output
  ccu002_01-smoking-status-chain---primary:
    run: ccu002_01-smoking-status-chain---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-exheavy---primary/output
  unknown-ccu002_01-smoking-status---primary:
    run: unknown-ccu002_01-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-chain---primary/output
  ccu002_01-smoking-status-excigar---primary:
    run: ccu002_01-smoking-status-excigar---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: unknown-ccu002_01-smoking-status---primary/output
  ccu002_01-smoking-status-exmoderate---primary:
    run: ccu002_01-smoking-status-exmoderate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-excigar---primary/output
  ccu002_01-smoking-status-consumption---primary:
    run: ccu002_01-smoking-status-consumption---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-exmoderate---primary/output
  ccu002_01-smoking-status-stopped---primary:
    run: ccu002_01-smoking-status-stopped---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-consumption---primary/output
  ccu002_01-smoking-status-started---primary:
    run: ccu002_01-smoking-status-started---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-stopped---primary/output
  ccu002_01-smoking-status-interested---primary:
    run: ccu002_01-smoking-status-interested---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-started---primary/output
  ccu002_01-smoking-status-trying---primary:
    run: ccu002_01-smoking-status-trying---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-interested---primary/output
  ccu002_01-smoking-status-thinking---primary:
    run: ccu002_01-smoking-status-thinking---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-trying---primary/output
  ccu002_01-smoking-status-reduced---primary:
    run: ccu002_01-smoking-status-reduced---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-thinking---primary/output
  ccu002_01-smoking-status-first---primary:
    run: ccu002_01-smoking-status-first---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-reduced---primary/output
  ccu002_01-smoking-status-nonsmoker---primary:
    run: ccu002_01-smoking-status-nonsmoker---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-first---primary/output
  ccu002_01-smoking-status-rolls---primary:
    run: ccu002_01-smoking-status-rolls---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-nonsmoker---primary/output
  occasional-ccu002_01-smoking-status---primary:
    run: occasional-ccu002_01-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-rolls---primary/output
  ccu002_01-smoking-status-smoker---primary:
    run: ccu002_01-smoking-status-smoker---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: occasional-ccu002_01-smoking-status---primary/output
  ccu002_01-smoking-status-wants---primary:
    run: ccu002_01-smoking-status-wants---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-smoker---primary/output
  ccu002_01-smoking-status-restarting---primary:
    run: ccu002_01-smoking-status-restarting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-wants---primary/output
  ready-ccu002_01-smoking-status---primary:
    run: ready-ccu002_01-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule28
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-restarting---primary/output
  ccu002_01-smoking-status-tobacco---primary:
    run: ccu002_01-smoking-status-tobacco---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule29
      potentialCases:
        id: potentialCases
        source: ready-ccu002_01-smoking-status---primary/output
  ccu002_01-smoking-status-attempt---primary:
    run: ccu002_01-smoking-status-attempt---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule30
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-tobacco---primary/output
  mental-ccu002_01-smoking-status---primary:
    run: mental-ccu002_01-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule31
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-attempt---primary/output
  ccu002_01-smoking-status-pregnancy---primary:
    run: ccu002_01-smoking-status-pregnancy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule32
      potentialCases:
        id: potentialCases
        source: mental-ccu002_01-smoking-status---primary/output
  ccu002_01-smoking-status-review---primary:
    run: ccu002_01-smoking-status-review---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule33
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-pregnancy---primary/output
  ccu002_01-smoking-status-dependence---primary:
    run: ccu002_01-smoking-status-dependence---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule34
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-review---primary/output
  current-ccu002_01-smoking-status---primary:
    run: current-ccu002_01-smoking-status---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule35
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-dependence---primary/output
  ccu002_01-smoking-status-behav---primary:
    run: ccu002_01-smoking-status-behav---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule36
      potentialCases:
        id: potentialCases
        source: current-ccu002_01-smoking-status---primary/output
  ccu002_01-smoking-status-stopping---primary:
    run: ccu002_01-smoking-status-stopping---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule37
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-behav---primary/output
  ccu002_01-smoking-status-reading---primary:
    run: ccu002_01-smoking-status-reading---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule38
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-stopping---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule39
      potentialCases:
        id: potentialCases
        source: ccu002_01-smoking-status-reading---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
  inputModule28:
    id: inputModule28
    doc: Python implementation unit
    type: File
  inputModule29:
    id: inputModule29
    doc: Python implementation unit
    type: File
  inputModule30:
    id: inputModule30
    doc: Python implementation unit
    type: File
  inputModule31:
    id: inputModule31
    doc: Python implementation unit
    type: File
  inputModule32:
    id: inputModule32
    doc: Python implementation unit
    type: File
  inputModule33:
    id: inputModule33
    doc: Python implementation unit
    type: File
  inputModule34:
    id: inputModule34
    doc: Python implementation unit
    type: File
  inputModule35:
    id: inputModule35
    doc: Python implementation unit
    type: File
  inputModule36:
    id: inputModule36
    doc: Python implementation unit
    type: File
  inputModule37:
    id: inputModule37
    doc: Python implementation unit
    type: File
  inputModule38:
    id: inputModule38
    doc: Python implementation unit
    type: File
  inputModule39:
    id: inputModule39
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
