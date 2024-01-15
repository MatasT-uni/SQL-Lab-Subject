using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab02
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
            lbHI.Text += " " + Form1.title + " " + Form1.firstName + " " + Form1.lastName + "!!!";
            lbWE.Text += Form1.group + ".";
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void bt2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 f1 = new Form1();
            f1.ShowDialog();
        }
    }
}
