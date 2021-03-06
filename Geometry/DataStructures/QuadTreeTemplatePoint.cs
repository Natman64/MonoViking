﻿using System;
using System.Diagnostics; 
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Geometry;

namespace Geometry
{
    /// <summary>
    /// Stores a quadtree 
    /// </summary>
     public class QuadTreeTemplatePoint<TPoint, TValue>
         where TPoint : struct, IPoint
    {
        //GridVector2[] _points;
         QuadTreeNodeTemplatePoint<TPoint, TValue> Root;

        /// <summary>
        /// Maps the values to the node containing the values. Populated by the QuadTreeNode class.
        /// </summary>
         internal Dictionary<TValue, QuadTreeNodeTemplatePoint<TPoint, TValue>> ValueToNodeTable = new Dictionary<TValue, QuadTreeNodeTemplatePoint<TPoint, TValue>>(); 

        public QuadTreeTemplatePoint(GridRectangle border)
        {
            //Create a root centered at 0,0
            this.Root = new QuadTreeNodeTemplatePoint<TPoint, TValue>(this, border);
        }

        public QuadTreeTemplatePoint(TPoint[] keys, TValue[] values, GridRectangle border)
        {
            CreateTree(keys, values,  border); 
        }
        
        /// <summary>
        /// Insert a new point within the borders into the tree
        /// </summary>
        /// <param name="point"></param>
        /// <param name="value"></param>
        public void Add(TPoint point, TValue value)
        {
            if (Root.Border.Contains(point) == false)
            {
                throw new ArgumentOutOfRangeException("point", "The passed point for insertion was out of range of the QuadTree");
            }

            this.Root.Insert(point, value);
        }

        public bool Contains(TValue value)
        {
            return ValueToNodeTable.ContainsKey(value);
        }

        public void Remove(TValue value)
        {
            if (ValueToNodeTable.ContainsKey(value) == false)
            {
                throw new ArgumentException("Quadtree does not contains requested value to delete");
            }

            QuadTreeNodeTemplatePoint<TPoint, TValue> node = ValueToNodeTable[value];

            if (node.Parent != null)
                node.Parent.Remove(node);
            else
            {
                //We are removing the root node.  State that it has no value and return
                node.HasValue = false;
                ValueToNodeTable.Remove(node.Value);
            }
        }

        private void CreateTree(TPoint[] keys, TValue[] values, GridRectangle border)
        {
            //Create a node centered in the border
            //this.Root = new QuadTreeNode<T>(this, new GridRectangle(double.MinValue, double.MaxValue, double.MinValue, double.MaxValue));
            this.Root = new QuadTreeNodeTemplatePoint<TPoint, TValue>(this, border); 

            for (int iPoint = 0; iPoint < keys.Length; iPoint++)
            {
                this.Root.Insert(keys[iPoint], values[iPoint]);
            }
        }

        public TValue FindNearest(TPoint point, out double distance)
        {
            TPoint nodePoint;
            distance = double.MaxValue;
            if (Root == null)
            {
                return default(TValue); 
            }
            else if (Root.IsLeaf == true && Root.HasValue == false)
            {
                return default(TValue); 
            }

            return Root.FindNearest(point, out nodePoint, ref distance);
        }

        public TPoint FindPosition(TValue value)
        {
            if (ValueToNodeTable.ContainsKey(value) == false)
            {
                throw new ArgumentException("Quadtree does not contains requested value");
            }

            QuadTreeNodeTemplatePoint<TPoint, TValue> node = ValueToNodeTable[value];

            return node.Point; 
        }

        /// <summary>
        /// Return all points and values in the quadtree which fall inside the rectangle. Indicies correspond
        /// </summary>
        /// <param name="gridRect"></param>
        /// <returns></returns>
        public void Intersect(GridRectangle gridRect, out List<TPoint> outPoints, out List<TValue> outValues)
        {
            this.Root.Intersect(gridRect, true, out outPoints, out outValues);
            return; 
        }
    }
}
