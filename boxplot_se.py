from math import *
import matplotlib.pyplot as plt; plt.rcdefaults()
import numpy as np
import matplotlib.pyplot as plt
hfont = {'fontname':'Helvetica'}
termname = ["Normoxia", "4h Hypoxia", "24h Hypoxia"]

log10pval = [230, 259, 218]

g = tuple(termname)
print g
y_pos = np.arange(len(g))


plt.bar(y_pos, log10pval,  align='center', alpha=0.5)
plt.xticks(y_pos, g, **hfont)

plt.xlabel('Condition', **hfont)
plt.ylabel('Number of predicted super enhancers', **hfont)
plt.title('Predicted Super Enhancers in MCF-7 cells in Normoxia and Hypoxia', **hfont)
plt.show()
