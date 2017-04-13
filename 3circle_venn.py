from matplotlib import pyplot as plt
import numpy as np
from matplotlib_venn import venn3
plt.figure(figsize=(4,4))
diagram = venn3(subsets=(1,1,1,1,1,1,1), set_labels = ('Normoxia', '4h Hypoxia', '24h Hypoxia'))
diagram.get_label_by_id('111').set_text(182)
diagram.get_label_by_id('101').set_text(5)
diagram.get_label_by_id('100').set_text(22)
diagram.get_label_by_id('010').set_text(33)
diagram.get_label_by_id('001').set_text(8)
diagram.get_label_by_id('110').set_text(21)
diagram.get_label_by_id('011').set_text(23)
plt.title("Predicted Super Enhancers in MCF-7 cells in Normoxia and Hypoxia")
#(Abc, aBc, ABc, abC, AbC, aBC, ABC)
plt.show()
